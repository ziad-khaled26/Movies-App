import 'package:flutter/material.dart';
import 'package:movies/core/resources/colors_manager.dart';

class ThemeManager{
  static final ThemeData dark=ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: ColorsManager.gray,
      selectedItemColor: ColorsManager.yellow,
      unselectedItemColor: ColorsManager.white,
      type: BottomNavigationBarType.fixed,
    )
  );
}