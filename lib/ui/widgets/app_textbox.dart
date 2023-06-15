// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wandertrip/ui/shared/app_border_radius.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';

class AppTextBoxWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? errorMessage;
  final TextInputType keyboardType;
  final bool isEmailField;
  final bool isPasswordField;
  final bool isFirstNameField;
  final bool isLastNameField;
  final bool obscureText;
  final Widget? suffixIcon;
  Function(String value)? onChanged;
  VoidCallback? onSuffixClicked;
  AppTextBoxWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.errorMessage,
    this.keyboardType = TextInputType.text,
    this.isEmailField = false,
    this.isPasswordField = false,
    this.isFirstNameField = false,
    this.isLastNameField = false,
    this.obscureText = false,
    this.onChanged,
    this.suffixIcon,
    this.onSuffixClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon ?? const SizedBox(),
          focusedBorder: OutlineInputBorder(
              borderRadius: AppBorderRadius.mediumBorderRadius,
              borderSide: const BorderSide(color: AppColors.kSecondaryColor)),
          border: OutlineInputBorder(
            borderRadius: AppBorderRadius.mediumBorderRadius,
          ),
          errorText: errorMessage == "" ? null : errorMessage,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
