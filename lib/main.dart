import 'package:flutter/material.dart';
import 'package:hoam_v1/core/resources/themes.dart';
import 'package:hoam_v1/ui/pages/home.dart';
import 'package:hoam_v1/ui/pages/login_page.dart';

import 'ui/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Owners Association Mobile',
      theme: lightThemeData,
       darkTheme: darkThemeData,
      home: SplashScreen(),
    );
  }
}
