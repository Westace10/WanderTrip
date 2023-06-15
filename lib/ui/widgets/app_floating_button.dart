import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';

class AppFloatingActionButton extends StatelessWidget {
  final bool visible;
  const AppFloatingActionButton({
    Key? key,
    this.visible = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.tips_and_updates,
      visible: visible,
      activeIcon: Icons.close,
      backgroundColor: AppColors.kSecondaryColor,
      foregroundColor: AppColors.kPrimaryColor,
      overlayColor: AppColors.kBlackColor.withOpacity(0.9),
      children: [
        SpeedDialChild(
          child: const Icon(Icons.flight),
          backgroundColor: AppColors.kPrimaryColor,
          onTap: () {
            // Handle flights option click
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.hotel),
          backgroundColor: AppColors.kPrimaryColor,
          onTap: () {
            // Handle hotels option click
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.directions_car),
          backgroundColor: AppColors.kPrimaryColor,
          onTap: () {
            // Handle cars option click
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.directions_boat),
          backgroundColor: AppColors.kPrimaryColor,
          onTap: () {
            // Handle cruise option click
          },
        ),
      ],
    );
  }
}
