import 'package:flutter/material.dart';
import 'package:dji/utils/colors.dart';
import 'package:dji/utils/constants.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: purplePrimary,
    accentColor: greyPrimary,
    fontFamily: AvailableFonts.primaryFont,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
