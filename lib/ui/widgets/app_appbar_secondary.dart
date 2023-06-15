import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wandertrip/ui/shared/app_border_radius.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';
import 'package:wandertrip/ui/shared/app_spacing.dart';

class AppAppBarSec extends StatelessWidget {
  final String userName;
  final String location;
  final String profilePicture;

  const AppAppBarSec({
    super.key,
    required this.userName,
    required this.location,
    required this.profilePicture,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.largeBorderRadius,
        color: AppColors.kWhiteColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, $userName',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    color: AppColors.kSecondaryFadeColor80,
                  ),
                ),
                AppSpacing.verticalSpaceMicroSmallie,
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 14,
                      color: AppColors.kSecondaryColor,
                    ),
                    Text(
                      location,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: AppColors.kSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: AppColors.kWhiteColor,
            backgroundImage: AssetImage(profilePicture),
            radius: 20,
          ),
        ],
      ),
    );
  }
}
