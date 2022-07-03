import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // static const colorBackground1 = Color(0xff1E1E1E);
  // static const colorBackground2 = Color(0x26FAFAFA);
  // static const colorBackground2Sub = Color(0x0D000000);
  //
  // static const colorBackgroundFlashCard = Color(0xB3323232);
  //
  // //gradient
  // static const gradientPurple = LinearGradient(
  //     colors: [Color(0xffC79CFF), Color(0xff9FBFFF)],
  //     begin: Alignment.bottomLeft,
  //     end: Alignment.topRight);
  // static const gradientYellow = LinearGradient(
  //     colors: [Color(0xffFFFB9C), Color(0xffFFB69F)],
  //     begin: Alignment.bottomLeft,
  //     end: Alignment.topRight);
  // static const gradientPink = LinearGradient(
  //     colors: [Color(0xffFF9C9C), Color(0xffFF83CD)],
  //     begin: Alignment.bottomLeft,
  //     end: Alignment.topRight);
  // static const gradientRed = LinearGradient(
  //     colors: [Color(0xffF85757), Color(0xffFF838B)],
  //     begin: Alignment.bottomLeft,
  //     end: Alignment.topRight);
  // static const gradientCyan = LinearGradient(
  //     colors: [Color(0xff9CFFD5), Color(0xff83CBFF)],
  //     begin: Alignment.bottomLeft,
  //     end: Alignment.topRight);

  // static const colorHeaderText = Color(0xff232323);
  // static const colorBodyText = Color(0xff232323);
  // static const colorText1 = Colors.white;
  // static const colorText2 = Color.fromRGBO(250, 250, 250, 0.9);
  // static const colorText3 = Color.fromRGBO(255, 255, 255, 0.3);
  // static const colorText4 = Color(0xff53D496);
  // static const colorText5 = Color(0xffFF5959);

  //primary color
  static const colorSpaceCadet = Color(0xff19173D);
  static const colorWhite = Color(0xffFFFFFF);
  static const colorWhite87 = Color(0xdeFFFFFF);
  static const colorWhite10 = Color(0x1affffff);
  static const colorWhite30 = Color(0x4DFFFFFF);
  static const colorRhythm = Color(0xff7B78AA);
  static const colorVividSkyBlue = Color(0xff00D7FF);
  static const colorPacificBlue30 = Color(0x4d0da6c2);

  //card base color
  static const colorBlueSapphire = Color(0xff005F73);
  static const colorViridianGreen = Color(0xff0A9396);
  static const colorMiddleBlueGreen = Color(0xff94D2BD);
  static const colorMediumChampagne = Color(0xffE9D8A6);
  static const colorGamboge = Color(0xffEE9B00);
  static const colorAlloyOrange = Color(0xffCA6702);
  static const colorRust = Color(0xffBB3E03);
  static const colorRufous = Color(0xffAE2012);
  static const colorRubyRed = Color(0xff9B2226);

  //card sub color
  static const colorBlueSapphireSub = Color(0xff001173);
  static const colorViridianGreenSub = Color(0xff0B3496);
  static const colorMiddleBlueGreenSub = Color(0xff92BBD1);
  static const colorMediumChampagneSub = Color(0xffCBE8A5);
  static const colorGambogeSub = Color(0xffED0008);
  static const colorAlloyOrangeSub = Color(0xffC90227);
  static const colorRustSub = Color(0xffBA0447);
  static const colorRufousSub = Color(0xffAD116F);
  static const colorRubyRedSub = Color(0xff9C2279);

  //card gradient color
  static const gradientBlueSapphire = LinearGradient(
      colors: [colorBlueSapphire, colorBlueSapphireSub],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  static const gradientViridianGreen = LinearGradient(
      colors: [colorViridianGreen, colorViridianGreenSub],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  static const gradientMiddleBlueGreen = LinearGradient(
      colors: [colorMiddleBlueGreen, colorMiddleBlueGreenSub],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  static const gradientMediumChampagne = LinearGradient(
      colors: [colorMediumChampagne, colorMediumChampagneSub],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  static const gradientGamboge = LinearGradient(
      colors: [colorGamboge, colorGambogeSub],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  static const gradientAlloyOrange = LinearGradient(
      colors: [colorAlloyOrange, colorAlloyOrangeSub],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  static const gradientRust = LinearGradient(
      colors: [colorRust, colorRustSub],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  static const gradientRufous = LinearGradient(
      colors: [colorRufous, colorRufousSub],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  static const gradientRubyRed = LinearGradient(
      colors: [colorRubyRed, colorRubyRedSub],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);

  static Gradient getBackgroundFromCategory(String category) {
    switch (category) {
      case 'noun':
        return AppColors.gradientRubyRed;
      case 'adjective':
        return AppColors.gradientAlloyOrange;
      case 'adverb':
        return AppColors.gradientBlueSapphire;
      case 'verb':
        return AppColors.gradientGamboge;
      case 'determiner':
        return AppColors.gradientMediumChampagne;
      case 'preposition':
        return AppColors.gradientMiddleBlueGreen;
      case 'conjunction':
        return AppColors.gradientRufous;
      case 'pronoun':
        return AppColors.gradientRust;
      case 'interjection':
        return AppColors.gradientViridianGreen;
      default:
        return AppColors.gradientBlueSapphire;
    }
  }
}
