import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ndialog/ndialog.dart';


extension KeyboardDismisser on Widget {
  Widget dismissKeyboardOnTap(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: this,
    );
  }

  Widget iphone11Size() {
    return ScreenUtilInit(
      designSize: const Size(828, 1792),
      builder: (context, child) => this,
    );
  }

  // Widget brightnessAdaptive(BuildContext context, [SystemUiOverlayStyle? force]) {
  //   return AnnotatedRegion<SystemUiOverlayStyle>(
  //     value: force ?? (ThemeProvider.theme(context).brightness == Brightness.light ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light),
  //     child: this,
  //   );
  // }
}

// extension FutureProgressDialog<T> on Future<T> {
//   Future<T?> showProgress(BuildContext context) => showCustomProgressDialog(context, loadingWidget: const AdaptiveProgressIndicator());
// }
