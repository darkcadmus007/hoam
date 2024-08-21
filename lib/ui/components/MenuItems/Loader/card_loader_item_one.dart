 import 'package:flutter/material.dart';

import '../../../../core/resources/themes.dart';
import '../../custom_divider.dart';
import '../../custom_shimmer.dart';

Widget CardItemLoaderItemOne(BuildContext context) {
    return Padding(
   padding: const EdgeInsets.symmetric( horizontal: 5.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: ShimmerContainer(
          child: Row(
            children: [
              ShimmerObject(width: 100, height: 100),
             
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerObject(width: 50, height: 10),
                    SizedBox(height: 8.0),
                    ShimmerObject(width: 50, height: 10),
                   ShimmerObject(width: 50, height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  