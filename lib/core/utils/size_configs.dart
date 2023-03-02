import 'package:flutter/material.dart';

// Responsive Design

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeW;
  static double? blockSizeH;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeW = screenWidth! / 100;
    blockSizeH = screenHeight! / 100;
  }
}
