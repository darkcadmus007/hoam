import 'package:flutter/material.dart';
import 'package:hoam_v1/core/resources/colors.dart';

import '../../core/resources/themes.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  AppbarWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Center(
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      title: Text(
        title,
        style: textTheme(context).headlineSmall!.copyWith(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: appbarColor, // Customize the color if needed
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
