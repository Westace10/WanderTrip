// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wandertrip/ui/shared/app_border_radius.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';

class AppStepIndicator extends StatelessWidget {
  int currentIndex;
  int? length;
  AppStepIndicator({super.key, this.currentIndex = 0, this.length});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          length ?? 0,
          (index) => AnimatedContainer(
            margin: const EdgeInsets.only(right: 5),
            duration: const Duration(milliseconds: 500),
            height: 5,
            width: MediaQuery.of(context).size.width * 0.30,
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.miniBorderRadius,
              color: currentIndex > index - 1
                  ? AppColors.kPrimaryColor
                  : AppColors.klightGreyColor,
            ),
          ),
        ),
      ),
    );
  }
}
