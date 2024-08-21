import 'package:flutter/material.dart';

import '../../../../core/resources/themes.dart';
import '../../custom_divider.dart';
import '../../custom_shimmer.dart';

Widget CardItemLoaderItemTwo(BuildContext context) {
  return Padding(
   padding: const EdgeInsets.symmetric( horizontal: 5.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: ShimmerContainer(
          child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ShimmerObject(width: 150, height: 10),
                    SizedBox(height: 15.0),
                    ShimmerObject(width: 150, height: 10),
                       SizedBox(height: 15.0),
                    ShimmerObject(width: 150, height: 10),
                        SizedBox(height: 15.0),
                    ShimmerObject(width: 250, height: 10),
                 
                  ],
                ),
              ),
        ),
      ),
    );
}
