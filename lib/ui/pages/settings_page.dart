import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hoam_v1/core/resources/colors.dart';
import 'package:hoam_v1/core/resources/themes.dart';
import 'package:hoam_v1/core/utils/navigations.dart';
import 'package:hoam_v1/ui/pages/login_page.dart';

import '../../core/resources/constant.dart';
import '../components/appbar_widget.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'Settings',
      ),
      body: Column(
        children: [
          // Profile Image
          Gap(50),
          CircleAvatar(
            radius: 50,
            backgroundImage:
                NetworkImage(defaultUserImage), // Replace with your image asset
          ),
          SizedBox(height: 16),
          // Name and Email
          Text(
            'John Price',
            style: textTheme(context)
                .titleLarge!
                .copyWith(color: primaryTextColor),
          ),
          SizedBox(height: 8),
          Text(
            'johnprice007@gmail.com',
            style: textTheme(context).labelLarge!.copyWith(color: greyColor),
          ),
          SizedBox(height: 24),
          // Menu Items
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Divider(
                    color: primaryColor,
                  ),
                ),
                Gap(20),
                _buildMenuItem(
                    context, Icons.person, 'Personal details', () {}),
                _buildMenuItem(context, Icons.settings, 'Settings', () {}),
                _buildMenuItem(
                    context, Icons.privacy_tip, 'Privacy Policy', () {}),
                _buildMenuItem(context, Icons.warning_amber,
                    'Terms and Conditions', () {}),
                _buildMenuItem(context, Icons.help_outline, 'FAQ', () {}),
                Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Divider(
                    color: primaryColor,
                  ),
                ),
                _buildMenuItem(context, Icons.logout, 'Logout', () {
                  replaceScreen(context, LoginPage());
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return Container(
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.black),
        ),
        title: Text(title,
            style: textTheme(context)
                .titleLarge!
                .copyWith(color: primaryTextColor)),
        trailing: Icon(Icons.arrow_forward_ios, color: greyColor),
        onTap: onTap,
      ),
    );
  }
}
