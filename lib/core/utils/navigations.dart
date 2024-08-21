// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

Future<T?> startScreen<T>(BuildContext context, dynamic screen) {
  try {
    // FirebaseCrashlytics.instance.log("Open ${screen.runtimeType}");
  } catch (_) {}
  return Navigator.push<T>(context, MaterialPageRoute(builder: (context) => screen));
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
