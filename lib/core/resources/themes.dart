import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData get lightThemeData => ThemeData.light().copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: lightBackground,
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(foregroundColor: Colors.black, padding: const EdgeInsets.all(20)),
      ),
      hintColor: Colors.black,
      drawerTheme: DrawerThemeData(
        backgroundColor: primaryColor,               
      ),
      appBarTheme: const AppBarTheme(
        
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      canvasColor: Colors.grey.shade200,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(),
          foregroundColor: ThemeData.light().textTheme.labelLarge!.color,
        ),
      ),
      colorScheme: const ColorScheme.light().copyWith(
        primary: primaryColor,
        secondary: secondaryColor,
        onSurface: Colors.black,
        surface: Colors.white,
        surfaceTint: primaryColor,
      ),
      dividerColor: Colors.transparent,
      brightness: Brightness.light,
      listTileTheme: const ListTileThemeData(
        iconColor: Colors.black,
      ),
      tabBarTheme: const TabBarTheme(
        tabAlignment: TabAlignment.fill,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
      ),
      dividerTheme: DividerThemeData(color: Colors.grey.withOpacity(.1)),
      textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Montserrat').copyWith(
            titleLarge: const TextStyle(fontSize: 20, color: Colors.black), //APPBAR TEXTSTYLE
          ),
      primaryTextTheme: ThemeData.light().textTheme.apply(fontFamily: 'Montserrat'),
    );

ThemeData get darkThemeData => ThemeData.dark().copyWith(
      primaryColor: darkPrimaryColor,
      brightness: Brightness.dark,
      hintColor: Colors.white,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(),
          foregroundColor: ThemeData.dark().textTheme.labelLarge!.color,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(foregroundColor: Colors.white, padding: const EdgeInsets.all(20))),
      scaffoldBackgroundColor: darkBackground,
      appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      colorScheme: const ColorScheme.light().copyWith(
        primary: darkPrimaryColor,
        secondary: secondaryColor,
        onSurface: Colors.white,
        surface: Colors.grey.shade800,
        surfaceTint: primaryColor,
      ),
      tabBarTheme: const TabBarTheme(
        tabAlignment: TabAlignment.fill,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: Colors.white,
      ),
      dividerTheme: DividerThemeData(color: Colors.grey.withOpacity(.2)),
      textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Montserrat').copyWith(
            titleLarge: const TextStyle(fontSize: 20, color: Colors.white), //APPBAR TEXTSTYLE
          ),
      primaryTextTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Montserrat'),
    );

ThemeData theme(BuildContext context) => Theme.of(context);
TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;
ColorScheme colorScheme(BuildContext context) => Theme.of(context).colorScheme;
