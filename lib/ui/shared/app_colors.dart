import 'package:flutter/material.dart';

class AppColors {
  static const Color kNoColor = Colors.transparent;
  static const Color kPrimaryColor = Color(0xFFA2D6F6);
  static Color kPrimaryFadeColor80 = const Color(0xFFA2D6F6).withOpacity(0.8);
  static Color kPrimaryFadeColor60 = const Color(0xFFA2D6F6).withOpacity(0.6);
  static Color kPrimaryFadeColor40 = const Color(0xFFA2D6F6).withOpacity(0.4);
  static Color kPrimaryFadeColor20 = const Color(0xFFA2D6F6).withOpacity(0.2);
  static Color kPrimaryFadeColor10 = const Color(0xFFA2D6F6).withOpacity(0.1);
  static const Color kSecondaryColor = Color(0xFF001F3F);
  static Color kSecondaryFadeColor80 = const Color(0xFF001F3F).withOpacity(0.8);
  static Color kSecondaryFadeColor60 = const Color(0xFF001F3F).withOpacity(0.6);
  static Color kSecondaryFadeColor40 = const Color(0xFF001F3F).withOpacity(0.4);
  static Color kSecondaryFadeColor20 = const Color(0xFF001F3F).withOpacity(0.2);
  static Color kSecondaryFadeColor10 = const Color(0xFF001F3F).withOpacity(0.1);
  static const Color kTertiaryColor = Color(0xFF3A506B);
  static const Color kWhiteColor = Color(0xFFFFFFFF);
  static const Color kBlackColor = Color(0xFF000000);
  static const Color klightGreyColor = Color(0xFFD9DCE0);
  static const Color kRedColor = Color(0xfff44336);
  static const Color kOrangeColor = Color(0xffff9800);
}

class AppGradients {
  static const LinearGradient kBckgrdGradient = LinearGradient(
    colors: [
      Color(0xFFEE8435),
      Color(0xFFE98234),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.53, 0.53],
  );

  static const LinearGradient kBckgrdBlckGradient = LinearGradient(
    colors: [
      Color(0xFFEE8435),
      Color(0xFFE98234),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.01, 0.53],
  );
}
