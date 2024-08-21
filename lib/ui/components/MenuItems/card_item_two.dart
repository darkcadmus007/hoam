import 'package:flutter/material.dart';

import '../../../core/resources/colors.dart';
import '../../../core/resources/themes.dart';
import '../custom_shimmer.dart';

class ItemCardTwo extends StatelessWidget {
  const ItemCardTwo({
    super.key,
    required this.val1,
    required this.val2,
    required this.val3,
    required this.val4,
    required this.key1,
    required this.key2,
    required this.key3,
    required this.key4,
  });

  final String val1;
  final String val2;
  final String val3;
  final String val4;
  final String key1;
  final String key2;
  final String key3;
  final String key4;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildLabelValue(key1, val1, context),
              ],
            ),
            SizedBox(height: 4.0),
            Row(
              children: [
                _buildLabelValue(key2, val2, context),
              ],
            ),
            SizedBox(height: 4.0),
            Row(
              children: [
                _buildLabelValue(key3, val3, context),
              ],
            ),
            SizedBox(height: 4.0),
            Row(
              children: [
                _buildLabelValue(key4, val4, context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabelValue(String label, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: RichText(
        text: TextSpan(
          text: '$label: ',
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
