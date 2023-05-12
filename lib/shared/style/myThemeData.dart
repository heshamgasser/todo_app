import 'package:flutter/material.dart';
import 'package:todo_app/shared/style/app_colors.dart';
import 'package:todo_app/shared/style/app_text.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    // useMaterial3: true,
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: lightPrimaryColor,
        onPrimary: lightPrimaryColor,
        secondary: Colors.white,
        onSecondary: lightTaskColor,
        error: Colors.red,
        onError: Colors.white,
        background: lightBackgroundColor,
        onBackground: Colors.white,
        surface: Colors.black,
        onSurface: Colors.white),
    scaffoldBackgroundColor: lightBackgroundColor,
    appBarTheme: AppBarTheme(
      color: lightPrimaryColor,
      foregroundColor: Colors.white,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(20),
      //     bottomRight: Radius.circular(20),
      //   ),
      // ),
      titleSpacing: 20,
    ),
    textTheme: TextTheme(
      titleLarge: lightTitleTextLarge,
      titleSmall: lightTitleTextSmall,
      bodyLarge: lightBodyTextLarge,
      bodySmall: lightBodyTextSmall,
      bodyMedium: lightBodyTextMedium,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    // useMaterial3: true,
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: darkPrimaryColor,
        onPrimary: darkPrimaryColor,
        secondary: Colors.black,
        onSecondary: darkTaskColor,
        error: Colors.red,
        onError: Colors.white,
        background: darkBackgroundColor,
        onBackground: Colors.black,
        surface: Colors.white,
        onSurface: Color(0xFF141922)),
    scaffoldBackgroundColor: darkBackgroundColor,
    appBarTheme: AppBarTheme(
      color: darkPrimaryColor,
      foregroundColor: Colors.black,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(20),
      //     bottomRight: Radius.circular(20),
      //   ),
      // ),
      titleSpacing: 20,
    ),
    textTheme: TextTheme(
      titleLarge: darkTitleTextLarge,
      titleSmall: darkTitleTextSmall,
      bodyLarge: darkBodyTextLarge,
      bodySmall: darkBodyTextSmall,
      bodyMedium: darkBodyTextMedium,
    ),
  );
}
