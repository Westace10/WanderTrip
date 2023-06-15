// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wandertrip/ui/shared/app_padding.dart';

class AppButton extends StatelessWidget {
  EdgeInsetsGeometry containerPadding;
  Widget buttonIcon;
  Widget? leadingIcon;
  Widget? trailingIcon;
  BorderRadiusGeometry? borderRadius;
  Color? backgroundColor;
  VoidCallback? onTap;
  AppButton({
    super.key,
    required this.buttonIcon,
    this.containerPadding = AppPadding.kEdgeInsetsAllSmall,
    this.leadingIcon,
    this.trailingIcon,
    this.borderRadius,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: containerPadding,
        decoration:
            BoxDecoration(borderRadius: borderRadius, color: backgroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leadingIcon ?? Container(),
            buttonIcon,
            trailingIcon ?? Container(),
          ],
        ),
      ),
    );
  }
}
