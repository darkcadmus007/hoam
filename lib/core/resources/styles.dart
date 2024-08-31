import 'package:flutter/material.dart';
import 'package:hoam_v1/core/resources/colors.dart';
import 'package:hoam_v1/core/utils/utils.dart';
import 'themes.dart';

ButtonStyle primaryButtonStyle(BuildContext context) => TextButton.styleFrom(
      foregroundColor: colorScheme(context).onPrimary,
      backgroundColor: colorScheme(context).primary,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      minimumSize: const Size(0, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
ButtonStyle lightGrayButtonStyle(BuildContext context) => TextButton.styleFrom(
      foregroundColor: Colors.white10,
      backgroundColor: Colors.white10,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      minimumSize: const Size(0, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );

ButtonStyle orangeButtonStyle(BuildContext context) => TextButton.styleFrom(
      foregroundColor: colorScheme(context).onPrimary,
      backgroundColor: colorScheme(context).secondary,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      minimumSize: const Size(0, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );

ButtonStyle orangeButtonBottomCornerStyle(BuildContext context) => TextButton.styleFrom(
      foregroundColor: colorScheme(context).onPrimary,
      backgroundColor: colorScheme(context).secondary,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      minimumSize: const Size(0, 40),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
    );

ButtonStyle outlineButtonStyle(BuildContext context) => TextButton.styleFrom(
      foregroundColor: textTheme(context).bodyMedium!.color,
      minimumSize: const Size(0, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: colorScheme(context).primary)),
    );

BoxDecoration primaryTabDecoration(BuildContext context) => BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: primaryColor,
    );

InputDecoration primaryInputDecoration(BuildContext context, Widget? prefixIcon) => InputDecoration(
    prefixIcon: prefixIcon,
      fillColor: theme(context).canvasColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      filled: true,
      labelStyle: textTheme(context).bodyMedium,
      hintStyle: textTheme(context).bodyMedium,
      errorStyle: textTheme(context).bodyMedium!.copyWith(color: Colors.red),
      counterStyle: textTheme(context).bodyMedium,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(strokeAlign: 1.0),
      ),
    );

SliverGridDelegate primarySliverGrid(BuildContext context, {double maxSize = 150, double aspectRatio = 1, double space = 10}) => SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: adeptGridItem(context, maxSize),
      mainAxisSpacing: space,
      crossAxisSpacing: space,
      childAspectRatio: aspectRatio,
    );

ShapeBorder get bottomSheetShape => const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20)));
