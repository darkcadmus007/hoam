import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hoam_v1/core/resources/themes.dart';
import 'package:hoam_v1/core/utils/utils.dart';
import 'package:hoam_v1/ui/pages/home.dart';
import 'package:hoam_v1/ui/pages/login_page.dart';

import '../../core/resources/colors.dart';
import '../../core/resources/styles.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                SizedBox(height: 25),

                Gap(10),

                // Login Text
                Text(
                  'Forgot Password',
                  style: textTheme(context)
                      .displaySmall!
                      .copyWith(color: primaryColor),
                ),

                Gap(15),

                // Subtitle
                Text(
                  textAlign: TextAlign.center,
                  'Enter email address associated with your account and we will send email with instruction to reset your password',
                  style: textTheme(context)
                      .titleMedium!
                      .copyWith(color: primaryTextColor),
                ),

                SizedBox(height: 30),

                // Email TextField
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: primaryInputDecoration(
                      context,
                      Icon(
                        Icons.email,
                        color: greyColor,
                      )).copyWith(
                    hintText: "Email",
                  ),
                ),

                // Forgot Password

                Gap(30),

                // Log In Button
                SizedBox(
                    height: 50,
                    width: 300,
                    child: TextButton(
                        onPressed: () {
                          startScreen(context, HomePage());
                        },
                        style: primaryButtonStyle(context),
                        child: Text("Login"))),

                SizedBox(height: 20),

                // Register Now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have account?"),
                    TextButton(
                      onPressed: () {
                        startScreen(context, LoginPage());
                      },
                      child: Text('Sign In'),
                    ),
                  ],
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
