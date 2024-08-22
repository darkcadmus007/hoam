// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

Future<T?> startScreen<T>(BuildContext context, dynamic screen) {
  try {
    // FirebaseCrashlytics.instance.log("Open ${screen.runtimeType}");
  } catch (_) {}
  return Navigator.push<T>(context,  PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = 0.0;
      var end = 1.0;
      var curve = Curves.ease;

      var opacityTween = Tween(begin: 0.0, end: 1.0);
      var scaleTween = Tween(begin: 0.8, end: 1.0);
      var fadeAnimation = animation.drive(opacityTween.chain(CurveTween(curve: curve)));
      var scaleAnimation = animation.drive(scaleTween.chain(CurveTween(curve: curve)));

      return FadeTransition(
        opacity: fadeAnimation,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: child,
        ),
      );
    },
  ),);
}

Future<T?> replaceScreen<T, TO>(BuildContext context, dynamic screen) {
  try {
    // FirebaseCrashlytics.instance.log("Open ${screen.runtimeType}");
  } catch (_) {}
  return Navigator.pushReplacement<T, TO>(context, MaterialPageRoute(builder: (context) => screen));
}

void closeScreen<T>(BuildContext context, [T? value]) {
  Navigator.pop<T>(context, value);
  // FirebaseCrashlytics.instance.log("Close this screen");
}
