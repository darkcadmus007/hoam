import 'package:flutter/material.dart';
import 'package:hoam_v1/core/resources/colors.dart';

import '../../../core/resources/themes.dart';

class LabelValueWidget extends StatelessWidget {
  final String label;
  final String value;

  const LabelValueWidget({super.key,    
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: RichText(
        text: TextSpan(
          text: '$label ',
          style:
              textTheme(context).labelLarge!.copyWith(color: primaryTextColor),
          children: [
            TextSpan(
              text: value,
              style: textTheme(context)
                  .labelLarge!
                  .copyWith(color: secondaryTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
