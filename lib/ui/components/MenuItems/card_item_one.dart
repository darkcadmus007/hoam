import 'package:flutter/material.dart';
import 'package:hoam_v1/core/resources/colors.dart';

import '../../../core/resources/themes.dart';

class ItemCardOne extends StatelessWidget {
  const ItemCardOne({
    super.key,
    required this.imageUrl,
    required this.headerTxt,
    required this.title,
    required this.subtitle,
  });

  final String imageUrl;
  final String headerTxt;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Row(
        children: [
          Image.network(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(headerTxt,  style: textTheme(context).bodyLarge!.copyWith(color: secondaryTextColor),),
                SizedBox(height: 8.0),
                Text(title,
                   style: textTheme(context).labelLarge!.copyWith(color: primaryTextColor)),
                Text(subtitle, style: textTheme(context).labelLarge!.copyWith(color: primaryTextColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  
}