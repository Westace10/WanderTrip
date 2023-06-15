import 'package:flutter/material.dart';

class AppSpacing {
  static const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
  static const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
  static const Widget horizontalSpaceRegular = SizedBox(width: 18.0);
  static const Widget horizontalSpaceMedium = SizedBox(width: 25.0);
  static const Widget horizontalSpaceLarge = SizedBox(width: 50.0);

  static const Widget verticalSpaceMicroSmallest = SizedBox(height: 1.0);
  static const Widget verticalSpaceMicroSmallie = SizedBox(height: 3.0);
  static const Widget verticalSpaceMicroSmall = SizedBox(height: 8.0);
  static const Widget verticalSpaceMicro = SizedBox(height: 16.0);
  static const Widget verticalSpaceMini = SizedBox(height: 24.0);
  static const Widget verticalSpaceTiny = SizedBox(height: 32.0);
  static const Widget verticalSpaceSmall = SizedBox(height: 40.0);
  static const Widget verticalSpaceRegular = SizedBox(height: 56.0);
  static const Widget verticalSpaceNormal = SizedBox(height: 64.0);
  static const Widget verticalSpaceMedium = SizedBox(height: 72);
  static const Widget verticalSpaceLarge = SizedBox(height: 80.0);
  static const Widget verticalSpaceMassive = SizedBox(height: 160.0);

  static const Widget distinctVerticalSpace =
      Expanded(child: SizedBox.shrink());
}
