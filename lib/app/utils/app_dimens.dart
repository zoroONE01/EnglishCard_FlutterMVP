import 'package:flutter/material.dart';

class AppDimens {
  static const paddingCard = 20.0;
  static const heightCard = 220.0;
  static const widthCard = 350.0;
  static const sizeIconNormal = 24.0;
  static const heightToolbar = 80.0;

  static getHeightDevice(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static getWidthDevice(BuildContext context) =>
      MediaQuery.of(context).size.width;

  AppDimens._();
}
