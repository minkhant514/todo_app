import 'package:flutter/material.dart';
import 'package:getx_tutorial/const/colors.dart';
import 'package:getx_tutorial/const/dimens.dart';

class ThemeHelper {
  static final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      toolbarHeight: kToolbarHeight + 10,
      elevation: 0,
      backgroundColor: kAppbarColor,
    ),
    useMaterial3: true,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    primaryColorLight: kPrimaryColor,
    brightness: Brightness.light,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
        ),
      ),
    ),
    dividerColor: Colors.black,
    dividerTheme: DividerThemeData(thickness: 2),
  );

  static final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      toolbarHeight: kToolbarHeight + 10,
      backgroundColor: kAppbarDarkColor,
      elevation: 0,
    ),
    useMaterial3: true,
    primaryColor: kPrimaryDarkColor,
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    primaryColorDark: kPrimaryDarkColor,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
        ),
      ),
    ),
    dividerColor: Colors.grey,
    dividerTheme: DividerThemeData(thickness: 2),
  );
}
