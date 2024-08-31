import 'package:flutter/material.dart';
import 'package:hoam_v1/core/resources/colors.dart';
import 'package:hoam_v1/core/resources/constant.dart';
import 'package:hoam_v1/core/resources/themes.dart';
import 'package:hoam_v1/core/utils/navigations.dart';
import 'package:hoam_v1/ui/pages/settings_page.dart';

class HeaderTwo extends StatelessWidget {
  const HeaderTwo({super.key});

   @override
  Widget build(BuildContext context) {
    return Container(
      color: headerBackgroundColor, // Background color of the bottom component
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Stanford Executive Subdivision',
                    style: textTheme(context).titleLarge!.copyWith(color: Colors.white),
                  ),
                  Text(
                    'Homeowners Association App',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.0),
            GestureDetector(
              onTap: (){
                startScreen(context, ProfileScreen());
              },
              child: CircleAvatar(
                radius: 20.0, // Adjust the size of the avatar
                backgroundImage: NetworkImage(defaultUserImage),
              ),
            ),
          ],
        ),
      ),
    );
  }
}