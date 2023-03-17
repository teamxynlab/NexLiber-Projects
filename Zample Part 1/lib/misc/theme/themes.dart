import 'package:flutter/material.dart';
import 'package:zample/misc/theme/colors.dart';

ThemeData darkTheme = ThemeData(
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 25.0, color: yellowColor, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontSize: 25.0, color: lightGreyColor),
    titleLarge: TextStyle(fontSize: 15.0, color: lightGreyColor),
    titleMedium: TextStyle(fontSize: 12.0, color: yellowColor),
    titleSmall: TextStyle(fontSize: 10.0, color: lightGreyColor),
    headlineMedium: TextStyle(fontSize: 15.0, color: yellowColor),
  ),
  primaryColor: lightGreyColor,
  highlightColor: yellowColor,
  bottomNavigationBarTheme: ThemeData.light().bottomNavigationBarTheme.copyWith(
        selectedItemColor: yellowColor,
        unselectedItemColor: darkGreyColor,
        showUnselectedLabels: false,
      ),
);
