// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wandertrip/core/constants/app_constant.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';
import 'package:wandertrip/ui/shared/app_spacing.dart';

class AppWalkthroughText extends StatelessWidget {
  int? index;
  AppWalkthroughText({
    super.key,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            walkthroughTextHeading[index!],
            style: GoogleFonts.montserrat(
              height: 1.5,
              fontSize: 42,
              color: AppColors.kWhiteColor,
              fontWeight: FontWeight.w300,
            ),
          ),
          AppSpacing.verticalSpaceMicroSmall,
          Text(
            walkthroughTextBody[index!],
            style: GoogleFonts.montserrat(
              height: 1.5,
              fontSize: 14,
              color: AppColors.kWhiteColor,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
