import 'package:flutter/material.dart';
import 'package:lautan_uang/core/utils/size_configs.dart';
import 'colors.dart';

// Ukuran Font

// < 3.5 = Very Small
// 3.5 = Small
// 4 = Medium
// 4.5 = Medium Large
// 5 = Large
// 7 & 10 = Extra or Super Large

// Text Normal and Bold
const textNormal = TextStyle(
  fontWeight: FontWeight.normal,
);

const textBold = TextStyle(
  fontWeight: FontWeight.bold,
);

// Text with Prussian Blue Color (Large, Medium, and Small)
final textSmallPrussianBlue = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: PrussianBlueColor,
);

final textVerySmallPrussianBlueNormal = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 2.5,
  fontWeight: FontWeight.normal,
  color: PrussianBlueColor,
);

final textSmallPrussianBlue500 = TextStyle(
  color: PrussianBlueColor,
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  fontWeight: FontWeight.w500,
);

final textMediumPrussianBlue500 = TextStyle(
  color: PrussianBlueColor,
  fontSize: SizeConfig.blockHorizontal! * 4,
  fontWeight: FontWeight.w500,
);

final textSmallPrussianBlueBold = TextStyle(
  color: PrussianBlueColor,
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  fontWeight: FontWeight.bold,
);

final textMediumLargePrussianBlueBold = TextStyle(
  color: PrussianBlueColor,
  fontSize: SizeConfig.blockHorizontal! * 4.5,
  fontWeight: FontWeight.bold,
);

final textLargePrussianBlueBold = TextStyle(
  color: PrussianBlueColor,
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
);

final textExtraLargePrussianBlueBold = TextStyle(
  color: PrussianBlueColor,
  fontSize: SizeConfig.blockHorizontal! * 10,
  fontWeight: FontWeight.bold,
);

// Text with Azure White Color (Large, Medium, and Small)
final textSmallAzureWhite = TextStyle(
  color: AzureishWhiteColor,
  fontSize: SizeConfig.blockHorizontal! * 3.5,
);

final textLargeAzureWhite = TextStyle(
  color: AzureishWhiteColor,
  fontSize: SizeConfig.blockHorizontal! * 5,
);

final textSmallAzureWhiteBold = TextStyle(
  color: AzureishWhiteColor,
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  fontWeight: FontWeight.bold,
);

final textLargeAzureWhite500 = TextStyle(
  color: AzureishWhiteColor,
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.w500,
);

final textLargeAzureWhiteBold = TextStyle(
  color: AzureishWhiteColor,
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
);

// Text with White Color (Large, Medium, and Small)
final textSmallWhite = TextStyle(
  color: Colors.white,
  fontSize: SizeConfig.blockHorizontal! * 3.5,
);

final textExtraLargeWhiteNormal = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.normal,
  fontSize: SizeConfig.blockHorizontal! * 5,
);

final textMediumWhiteBold = TextStyle(
  color: Colors.white,
  fontSize: SizeConfig.blockHorizontal! * 4,
  fontWeight: FontWeight.bold,
);

final textLargeWhiteBold = TextStyle(
  color: Colors.white,
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
);

final textExtraLargeWhiteBold = TextStyle(
  color: Colors.white,
  fontSize: SizeConfig.blockHorizontal! * 7,
  fontWeight: FontWeight.bold,
);

// Text with Grey Color (Large, Medium, and Small)
final textSmallGrey = TextStyle(
  color: Colors.grey,
  fontSize: SizeConfig.blockHorizontal! * 3.5,
);

// Text with Black Color (Large, Medium, and Small)
final textSmallBlack = TextStyle(
  color: Colors.black,
  fontSize: SizeConfig.blockHorizontal! * 3.5,
);

final textMediumBlack = TextStyle(
  color: Colors.black,
  fontSize: SizeConfig.blockHorizontal! * 4,
);

final textLargeBlack = TextStyle(
  color: Colors.black,
  fontSize: SizeConfig.blockHorizontal! * 5,
);

final textExtraLargeBlackNormal = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.normal,
  fontSize: SizeConfig.blockHorizontal! * 5,
);

final textSmallBlackBold = TextStyle(
  color: Colors.black,
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  fontWeight: FontWeight.bold,
);

final textMediumBlackBold = TextStyle(
  color: Colors.black,
  fontSize: SizeConfig.blockHorizontal! * 4,
  fontWeight: FontWeight.bold,
);

final textLargeBlackBold = TextStyle(
  color: Colors.black,
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
);

// Text Error Message Color (Large, Medium, and Small)
final textErrorMessageBold = TextStyle(
  color: ErrorMessageColor,
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  fontWeight: FontWeight.bold,
);
