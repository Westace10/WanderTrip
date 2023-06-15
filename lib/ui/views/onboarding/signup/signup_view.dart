import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:wandertrip/core/constants/app_constant.dart';
import 'package:wandertrip/ui/shared/app_border_radius.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';
import 'package:wandertrip/ui/shared/app_padding.dart';
import 'package:wandertrip/ui/shared/app_spacing.dart';
import 'package:wandertrip/ui/views/onboarding/signup/signup_viewmodel.dart';
import 'package:wandertrip/ui/widgets/app_button.dart';
import 'package:wandertrip/ui/widgets/app_loader.dart';
import 'package:wandertrip/ui/widgets/app_textbox.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        child: LoaderView(
          loading: model.isBusy,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppSpacing.verticalSpaceSmall,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18.0,
                      vertical: 8.0,
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.85,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Create an account",
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SvgPicture.asset(
                                shortLogo,
                                height: 55,
                              )
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              "Explore breathtaking destinations, immerse yourself in diverse cultures, and create memories that will last a lifetime.",
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.0,
                                height: 1.3,
                              ),
                            ),
                          ),
                          AppSpacing.verticalSpaceSmall,
                          AppTextBoxWidget(
                            controller: model.emailController,
                            hintText: "Email address",
                            errorMessage: model.emailErrorMessage,
                            onChanged: (value) {
                              model.onEmailChanged(value);
                            },
                          ),
                          AppSpacing.verticalSpaceMicro,
                          AppTextBoxWidget(
                            controller: model.firstnameController,
                            hintText: "First name",
                            errorMessage: model.firstnameErrorMessage,
                            onChanged: (value) {
                              model.onFirstnameChanged(value);
                            },
                          ),
                          AppSpacing.verticalSpaceMicro,
                          AppTextBoxWidget(
                            controller: model.lastnameController,
                            hintText: "Last name",
                            errorMessage: model.lastnameErrorMessage,
                            onChanged: (value) {
                              model.onLastnameChanged(value);
                            },
                          ),
                          AppSpacing.verticalSpaceMicro,
                          AppTextBoxWidget(
                            controller: model.passwordController,
                            obscureText: model.obscureText,
                            hintText: "Password",
                            errorMessage: model.passwordErrorMessage,
                            suffixIcon: IconButton(
                              onPressed: () {
                                model.onObscureClicked();
                              },
                              icon: model.obscureText
                                  ? Text(
                                      "Show",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  : Text(
                                      "Hide",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                            ),
                            onChanged: (value) {
                              model.onPasswordChanged(value);
                            },
                          ),
                          AppSpacing.verticalSpaceMicro,
                          AppTextBoxWidget(
                            controller: model.confirmPasswordController,
                            obscureText: model.obscureConfirmText,
                            hintText: "Confirm Password",
                            errorMessage: model.confirmPasswordErrorMessage,
                            suffixIcon: IconButton(
                              onPressed: () {
                                model.onObscureConfirmClicked();
                              },
                              icon: model.obscureConfirmText
                                  ? Text(
                                      "Show",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  : Text(
                                      "Hide",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                            ),
                            onChanged: (value) {
                              model.onConfirmPasswordChanged(
                                  value, model.passwordController.text);
                            },
                          ),
                          AppSpacing.distinctVerticalSpace,
                          AppButton(
                            borderRadius: AppBorderRadius.normalBorderRadius,
                            backgroundColor: AppColors.kPrimaryColor,
                            buttonIcon: Padding(
                              padding: AppPadding.kEdgeInsetsAllSmall,
                              child: Text(
                                "Create account",
                                style: GoogleFonts.montserrat(
                                  height: 1.5,
                                  fontSize: 14,
                                  color: AppColors.kSecondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            onTap: () => model.createUserAccount(),
                          ),
                          AppButton(
                            buttonIcon: Text(
                              "Already have an account? Login",
                              style: GoogleFonts.montserrat(
                                height: 1.5,
                                fontSize: 14,
                                color: AppColors.kSecondaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onTap: () => model.goToLogin(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppSpacing.verticalSpaceSmall,
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SignupViewModel(),
    );
  }
}
