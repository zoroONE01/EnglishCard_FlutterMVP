import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

abstract class AppThemeData {
  ThemeMode get mode;

  ThemeData get material => ThemeData(
      textTheme: TextTheme(
        headline1: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 40.0,
            color: colorTextPrimary),
        headline2: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
            color: colorTextPrimary),
        headline3: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17.0,
            color: colorTextSecondary),
        bodyText1: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15.0,
            color: colorTextPrimary),
        bodyText2: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 13.0,
            color: colorTextPrimary),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorBackgroundPrimary,
        elevation: 0,
        centerTitle: false,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorBackgroundPrimary,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      ),
      fontFamily: AppStrings.nunito,
      scaffoldBackgroundColor: colorBackgroundPrimary);

  Color get colorBackgroundPrimary;

  Color get colorTextPrimary;

  Color get colorTextSecondary;

  // CardTheme get cardNounTheme;
}

class AppDarkThemeData extends AppThemeData {
  @override
  Color get colorTextSecondary => AppColors.colorWhite;

  @override
  Color get colorTextPrimary => AppColors.colorWhite;

  @override
  ThemeMode get mode => ThemeMode.dark;

  @override
  Color get colorBackgroundPrimary => AppColors.colorSpaceCadet;

  // @override
  // CardTheme get cardNounTheme => CardTheme(gradient: AppColors.gradientBlueSapphire);
}

class AppLightThemeData extends AppThemeData {
  @override
  Color get colorTextSecondary => AppColors.colorWhite;

  @override
  Color get colorTextPrimary => AppColors.colorWhite;

  @override
  ThemeMode get mode => ThemeMode.light;

  @override
  Color get colorBackgroundPrimary => AppColors.colorSpaceCadet;


}
