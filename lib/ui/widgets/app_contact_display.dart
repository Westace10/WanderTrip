import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';

class AppContactDisplay extends StatelessWidget {
  final String userName;
  final String userPhone;
  final String userEmail;
  const AppContactDisplay({
    super.key,
    required this.userName,
    required this.userPhone,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          userName,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: AppColors.kSecondaryColor,
          ),
        ),
        Text(
          userEmail,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.kSecondaryColor,
          ),
        ),
        Text(
          userPhone,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.kSecondaryColor,
          ),
        ),
      ],
    );
  }
}
