// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wandertrip/ui/shared/app_border_radius.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';
import 'package:wandertrip/ui/shared/app_padding.dart';
import 'package:wandertrip/ui/widgets/app_button.dart';

class AppWalkthroughButton extends StatelessWidget {
  int? index;
  VoidCallback? onTapPrev;
  VoidCallback? onTapNext;
  VoidCallback? getStarted;
  AppWalkthroughButton({
    super.key,
    this.index,
    this.onTapPrev,
    this.onTapNext,
    this.getStarted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          index == 0
              ? Container()
              : AppButton(
                  leadingIcon: const Icon(
                    Icons.chevron_left,
                    color: AppColors.kWhiteColor,
                  ),
                  buttonIcon: Padding(
                    padding: AppPadding.kEdgeInsetsHorizontalTiny,
                    child: Text(
                      "Previous",
                      style: GoogleFonts.montserrat(
                        height: 1.5,
                        fontSize: 14,
                        color: AppColors.kWhiteColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  onTap: onTapPrev,
                ),
          AppButton(
            backgroundColor: index == 2 ? AppColors.kPrimaryColor : null,
            borderRadius:
                index == 2 ? AppBorderRadius.normalBorderRadius : null,
            trailingIcon: Icon(
              Icons.chevron_right,
              color: index == 2
                  ? AppColors.kSecondaryColor
                  : AppColors.kWhiteColor,
            ),
            buttonIcon: Padding(
              padding: AppPadding.kEdgeInsetsHorizontalTiny,
              child: Text(
                index == 2 ? "Get started" : "Next",
                style: GoogleFonts.montserrat(
                  height: 1.5,
                  fontSize: 14,
                  color: index == 2
                      ? AppColors.kSecondaryColor
                      : AppColors.kWhiteColor,
                  fontWeight: index == 2 ? FontWeight.w500 : FontWeight.w300,
                ),
              ),
            ),
            onTap: index == 2 ? getStarted : onTapNext,
          ),
        ],
      ),
    );
  }
}
