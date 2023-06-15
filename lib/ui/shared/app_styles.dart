import 'package:flutter/material.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';

class AppStyles {
  static const TextStyle kPageHeadingTitle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    fontFamily: "Fellix",
  );
  static const TextStyle kPageHeadingSubTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    fontFamily: "Fellix",
  );
  static const TextStyle kWidgetHeadingTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: "Fellix",
  );
  static const TextStyle kWidgetHeadingSubTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: "Fellix",
  );
  static const TextStyle kBodyText = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: "Fellix",
      color: AppColors.kBlackColor);
  static const TextStyle kValidation = TextStyle(
    fontSize: 12,
    color: AppColors.kRedColor,
    fontWeight: FontWeight.normal,
    fontFamily: "Fellix",
  );
  static const TextStyle kButton = TextStyle(
    fontSize: 16,
    color: AppColors.kWhiteColor,
    fontWeight: FontWeight.w600,
    fontFamily: "Fellix",
  );

  // static final defaultPinTheme = PinTheme(
  //   width: 60,
  //   height: 60,
  //   decoration: BoxDecoration(
  //     color: AppColors.kDarkGreyColor.withOpacity(0.1),
  //     border: Border.all(color: AppColors.klightGreyColor),
  //     borderRadius: AppBorderRadius.normalBorderRadius,
  //   ),
  // );

  // static final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  //   color: AppColors.kPrimaryFadeColor,
  //   border: Border.all(color: AppColors.kPrimaryColor.withOpacity(0.3)),
  //   borderRadius: AppBorderRadius.normalBorderRadius,
  // );

  // static final submittedPinTheme = defaultPinTheme.copyDecorationWith(
  //   color: AppColors.kPrimaryFadeColor,
  //   border: Border.all(color: AppColors.klightGreyColor),
  //   borderRadius: AppBorderRadius.normalBorderRadius,
  // );
}
