import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:timeago/timeago.dart';
import 'package:hoam_v1/core/resources/styles.dart';
import 'package:hoam_v1/core/resources/themes.dart';

import '../resources/colors.dart';
import 'navigations.dart';

export 'navigations.dart';
export 'preferences.dart';

Future<String> getFileSize(String filepath, int decimals) async {
  var file = File(filepath);
  int bytes = await file.length();
  if (bytes <= 0) return "0 B";
  const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  var i = (log(bytes) / log(1024)).floor();
  return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
}

Future<File?> pickVideo(BuildContext context) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoActionSheet(
      title: Text("take_video_from".trim()),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () => ImagePicker()
              .pickVideo(source: ImageSource.gallery)
              .then((value) {
            File? file;
            if (value != null) {
              file = File(value.path);
            }
            closeScreen(context, file);
          }),
          child: Text("gallery".trim()),
        ),
        CupertinoActionSheetAction(
          onPressed: () =>
              ImagePicker().pickVideo(source: ImageSource.camera).then((value) {
            File? file;
            if (value != null) {
              file = File(value.path);
            }
            closeScreen(context, file);
          }),
          child: Text("camera".trim()),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
          onPressed: () => closeScreen(context),
          isDestructiveAction: true,
          isDefaultAction: true,
          child: Text("cancel".trim())),
    ),
  );
}

Future<File?> pickImage(BuildContext context,
    {bool crop = true,
    bool pickMedia = false,
    double? maxWidth,
    double? maxHeight}) async {
  // FirebaseCrashlytics.instance.log('pick_image');
  var picker = ImagePicker();
  var resp = await showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoActionSheet(
      title: Text("take_photo_from".trim()),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            picker
                .pickImage(source: ImageSource.gallery, maxWidth: maxWidth)
                .then((value) => closeScreen(context, value));
          },
          child: Text("gallery".trim()),
        ),
        CupertinoActionSheetAction(
          onPressed: () => picker
              .pickImage(source: ImageSource.camera, maxWidth: maxWidth ?? 1024)
              .then((value) => closeScreen(context, value)),
          child: Text("camera".trim()),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
          onPressed: () => closeScreen(context),
          isDestructiveAction: true,
          isDefaultAction: true,
          child: Text("cancel")),
    ),
  );
  if (resp != null) {
    var picked = File(resp.path);

    if (crop && !pickMedia) {
      var croper = ImageCropper();
      var croppedFile = await croper.cropImage(
        sourcePath: picked.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        compressFormat: ImageCompressFormat.jpg,
        maxWidth: size(context).width.toInt(),
        uiSettings: [
          AndroidUiSettings(
            toolbarWidgetColor: primaryColor,
            activeControlsWidgetColor: primaryColor,
          ),
        ],
      );

      if (croppedFile != null) {
        return await File(croppedFile.path)
            .rename("${croppedFile.path}_vmatch.png");
      }
    } else {
      return picked;
    }
  }
  return null;
}

String compactNumbersDecimal(int number, [String suffix = ""]) {
  if (suffix.isEmpty) {
    return NumberFormat.decimalPattern().format(number);
  }
  return "${NumberFormat.decimalPattern().format(number)} $suffix${number > 1 ? "s" : ""}";
}

String compactNumbers(int number, [String suffix = ""]) {
  if (suffix.isEmpty) {
    return NumberFormat.decimalPattern().format(number);
  }
  return "${NumberFormat.compact().format(number)} $suffix${number > 1 ? "s" : ""}";
}

// String timeFormat(BuildContext context, DateTime time) {
//   return format(time.toLocal(), locale: context.languageCode);
// }

String generateRandomString(int len) {
  var r = Random();
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
}

Future<void> showWarning(BuildContext context,
        {String? title, required String message}) =>
    NAlertDialog(
      title: Text(title ?? "attention".trim()),
      content: Text(message),
      actions: [
        TextButton(
            onPressed: () => closeScreen(context), child: const Text("Close"))
      ],
    ).show(context);

Future<bool?> showConfirmationDialog(BuildContext context,
    {required String title, required String message}) {
  return NAlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      TextButton(
          onPressed: () => closeScreen(context, true), child: Text("confirm")),
      TextButton(
          onPressed: () => closeScreen(context, false), child: Text("cancel")),
    ],
  ).show(context);
}

// Future<bool?> showInsufficientCoin(BuildContext context) {
//   return NAlertDialog(
//     title: Text("insufficient_coin_title".tr()),
//     content: Text("insufficient_coin_description".tr()),
//     actions: [
//       TextButton(onPressed: () => replaceScreen(context, const WalletScreen()), child: Text("recharge".tr())),
//       TextButton(onPressed: () => closeScreen(context, false), child: Text("cancel".tr())),
//     ],
//   ).show(context);
// }

///This will adjust grid item cross axis count
///In case user make landscape or using bigger devices, it will automatic adjust
int adeptGridItem(BuildContext context, [double maxSize = 150]) {
  return (size(context).width / maxSize).floor();
}

String durationText(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
  return "$twoDigitMinutes:$twoDigitSeconds";
}

Future<String?> pickBirthday(BuildContext context, String currentDate) async {
  DateTime currentTime = DateTime.now().subtract(const Duration(days: 10000));
  try {
    currentTime = DateFormat("yyyy-MM-dd").parseUtc(currentDate);
  } catch (_) {}

  DateTime? date = await DialogBackground(
    dialog: DatePickerDialog(
      firstDate: DateTime(1940),
      initialDate: currentTime.toLocal(),
      lastDate: DateTime(DateTime.now().year + 5),
      initialCalendarMode: DatePickerMode.day,
    ),
  ).show(context);

  if (date == null) {
    return null;
  } else {
    if (!_isMinimumAgeValid(date)) {
      showWarning(context, message: "You must be at least 18 years old.");
      return null;
    } else {
      return DateFormat("yyyy-MM-dd", 'en')
          .format(DateTime(date.year, date.month, date.day).toLocal())
          .toString();
    }
  }
}

bool _isMinimumAgeValid(DateTime dob) {
  final currentDate = DateTime.now();
  var age = currentDate.year - dob.year;

  if (currentDate.month < dob.month ||
      (currentDate.month == dob.month && currentDate.day < dob.day)) {
    age--;
  }

  return age >= 18;
}

void showToast(String message, [Color? backgroundColor]) =>
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.CENTER,
      backgroundColor: backgroundColor,
    );

Size size(BuildContext ctx) => MediaQuery.of(ctx).size;

String convertDate(
  String dateStr,
) {
  return "${DateFormat("MMM d, y").format(DateTime.parse(dateStr))} - ${DateFormat("jm").format(DateTime.parse(dateStr))}";
}
