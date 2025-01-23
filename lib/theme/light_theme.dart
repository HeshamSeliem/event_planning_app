import 'dart:ui';

import 'package:event_planning_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';

class LightTheme extends BaseTheme {
  @override
  Color get backgroundColor =>const Color(0xffF2FEFF);

  @override
  Color get primaryColor => const Color(0xff5669FF);

  @override
  Color get textColor => const Color(0xff1c1c1c);

  @override
  ThemeData get themeData => ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColor,
      centerTitle: true,
      iconTheme: IconThemeData(color: primaryColor)
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      selectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.white.withOpacity(0.5),
    ),
     floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
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
        color: primaryColor,
        fontWeight: FontWeight.w500
      ),
    ),
   
  );
}
