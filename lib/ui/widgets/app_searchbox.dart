// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wandertrip/ui/shared/app_border_radius.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';
import 'package:wandertrip/ui/shared/app_padding.dart';

class AppSearchBox extends StatelessWidget {
  Function(String value) onChanged;
  final TextEditingController searchController;
  final List<String> suggestions;
  final VoidCallback? onTap;

  AppSearchBox({
    super.key,
    required this.onChanged,
    required this.searchController,
    required this.suggestions,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: AppPadding.kEdgeInsetsHorizontalSmall,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.kNoColor,
                  width: 1,
                ),
                color: AppColors.kSecondaryFadeColor10,
                borderRadius: AppBorderRadius.normalBorderRadius,
              ),
              child: TextField(
                onTap: onTap != null ? () => onTap!() : () {},
                readOnly: onTap != null ? true : false,
                controller: searchController,
                onChanged: (value) {
                  log(suggestions.toString());
                  onChanged(value);
                },
                decoration: const InputDecoration(
                  hintText: 'Search destinations',
                  suffixIcon: Icon(Icons.search),
                  suffixIconColor: AppColors.kSecondaryColor,
                  border: InputBorder.none,
                ),
              ),
            ),
            // Visibility(
            //   visible: searchController.text.isNotEmpty,
            //   child: Positioned(
            //     top: 50.0,
            //     left: 0.0,
            //     right: 0.0,
            //     child: Card(
            //       elevation: 4.0,
            //       child: ListView.builder(
            //         shrinkWrap: true,
            //         itemCount: suggestions.length,
            //         itemBuilder: (context, index) {
            //           return ListTile(
            //             title: Text(suggestions[index]),
            //             onTap: () {
            //               // Handle suggestion selection
            //               searchController.clear();
            //             },
            //           );
            //         },
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
