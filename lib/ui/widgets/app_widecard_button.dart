import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wandertrip/ui/shared/app_border_radius.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';
import 'package:wandertrip/ui/shared/app_padding.dart';

class AppWideCardButton extends StatelessWidget {
  final IconData icon;
  final String buttonName;
  final Widget? widget;
  const AppWideCardButton({
    super.key,
    required this.icon,
    required this.buttonName,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4.0,
            vertical: 8.0,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            padding: AppPadding.kEdgeInsetsAllNormal,
            decoration: BoxDecoration(
                borderRadius: AppBorderRadius.normalBorderRadius,
                color: AppColors.kSecondaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(
                  Icons.settings,
                  color: AppColors.kPrimaryColor,
                ),
                Text(
                  "Settings",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
