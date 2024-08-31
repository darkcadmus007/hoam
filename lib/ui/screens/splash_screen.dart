import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoam_v1/core/utils/navigations.dart';
import 'package:hoam_v1/ui/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    super.initState();
    // Set the duration of the splash screen
    Timer(Duration(seconds: 2), () {
      // Navigate to the next screen after the timer ends
      replaceScreen(context, LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo or image
            Image.asset(
              'assets/images/hoam-logo.png',
              height: 150.0,
              width: 150.0,
            ),
            SizedBox(height: 20.0),
            // App name or text
           
          ],
        ),
      ),
    );
  }
}