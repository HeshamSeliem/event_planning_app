import 'dart:ui';

import 'package:event_planning_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';

class DarkTheme extends BaseTheme {
  @override
  Color get backgroundColor => const Color(0xff101127);

  @override
  Color get primaryColor => const Color(0xff5669FF);

  @override
  Color get textColor => const Color(0xffF4EBDC);

  @override
  ThemeData get themeData => ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColor,
      centerTitle: true,
      iconTheme: IconThemeData(color: primaryColor)
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundColor,
      selectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.white.withOpacity(0.5),
    ),
     floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: const BorderSide(color: Colors.white, width: 4),
      ),
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 20,
        color: primaryColor,
        fontWeight: FontWeight.w500
      ),
      titleSmall: TextStyle(
        fontSize: 13,
        color: textColor,
        fontWeight: FontWeight.w500
      ),
      titleLarge: TextStyle(
        fontSize: 23,
        color: textColor,
        fontWeight: FontWeight.w500
      ),
    ),
   
  );
}
