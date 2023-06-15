import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wandertrip/ui/shared/app_border_radius.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';
import 'package:wandertrip/ui/shared/app_padding.dart';

class AppSmallCardButton extends StatelessWidget {
  final IconData icon;
  final String buttonName;
  const AppSmallCardButton({
    super.key,
    required this.icon,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () => {},
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
              color: AppColors.kSecondaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  icon,
                  color: AppColors.kPrimaryColor,
                ),
                Text(
                  buttonName,
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
