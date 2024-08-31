import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hoam_v1/core/resources/themes.dart';
import 'package:hoam_v1/core/utils/utils.dart';
import 'package:hoam_v1/ui/pages/home.dart';

import '../../core/resources/colors.dart';
import '../../core/resources/styles.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                Image.asset(
                  'assets/images/hoam-logo.png', // Replace with your logo asset path
                  height: 200,
                ),
                Gap(10),

                // Login Text
                Text(
                  'Homeowners',
                  style: textTheme(context)
                      .displaySmall!
                      .copyWith(color: primaryColor),
                ),

                Gap(5),

                // Subtitle
                Text(
                  'Association App',
                  style: textTheme(context)
                      .titleLarge!
                      .copyWith(color: primaryTextColor),
                ),

                SizedBox(height: 30),

                // Email TextField
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: primaryInputDecoration(context, Icon(Icons.email, color: greyColor,)).copyWith(
                    hintText: "Email",
                  ),
                ),

                Gap(15),

                // Password TextField
                TextField(
                
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: primaryInputDecoration(context, Icon(Icons.lock, color: greyColor,)).copyWith(
                    hintText: "Password",
                  ),
                ),

                SizedBox(height: 10),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      startScreen(context, ForgotPassword());
                    },
                    child: Text('Forgot Password'),
                  ),
                ),

                SizedBox(height: 20),

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
                    Text("Don't have an account? "),
                    TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => RegisterPage()),
                        // );
                      },
                      child: Text('Sign Up'),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                // Social Media Login
                Text('Or connect with'),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.facebook),
                      onPressed: () {
                        // Add Facebook login functionality here
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.apple),
                      onPressed: () {
                        // Add Twitter login functionality here
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
