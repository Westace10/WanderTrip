// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:wandertrip/ui/shared/app_border_radius.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';
import 'package:wandertrip/ui/shared/app_spacing.dart';

class AppBottomNav extends StatelessWidget {
  final PageController? controller;
  final int? currentIndex;
  const AppBottomNav({
    Key? key,
    this.controller,
    this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.zero,
      notchMargin: 0.0,
      height: 75,
      shape: const CircularNotchedRectangle(),
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.largeBorderRadius,
            color: AppColors.kSecondaryColor,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    controller!.jumpToPage(0);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.travel_explore,
                          color: currentIndex == 0
                              ? AppColors.kPrimaryColor
                              : Colors.grey),
                      AppSpacing.horizontalSpaceTiny,
                      Text('Discover',
                          style: TextStyle(
                              color: currentIndex == 0
                                  ? AppColors.kPrimaryColor
                                  : Colors.grey)),
                    ],
                  ),
                ),
              ),
              // Expanded(
              //   flex: 1,
              //   child: IconButton(
              //     icon: Icon(Icons.stars,
              //         color: currentIndex == 1
              //             ? AppColors.kPrimaryColor
              //             : Colors.grey),
              //     onPressed: () {
              //       controller!.jumpToPage(1);
              //     },
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: IconButton(
              //     icon: Icon(Icons.diversity_2,
              //         color: currentIndex == 2
              //             ? AppColors.kPrimaryColor
              //             : Colors.grey),
              //     onPressed: () {
              //       controller!.jumpToPage(2);
              //     },
              //   ),
              // ),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(Icons.person,
                      color: currentIndex == 1
                          ? AppColors.kPrimaryColor
                          : Colors.grey),
                  onPressed: () {
                    controller!.jumpToPage(1);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
