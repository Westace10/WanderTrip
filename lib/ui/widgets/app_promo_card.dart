import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wandertrip/ui/shared/app_border_radius.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';
import 'package:wandertrip/ui/shared/app_padding.dart';

class AppPromoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? icon;
  const AppPromoCard(
      {super.key, required this.title, required this.subtitle, this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.kWhiteColor,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.kWhiteColor,
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
