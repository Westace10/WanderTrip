import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:wandertrip/core/constants/app_constant.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';
import 'package:wandertrip/ui/shared/app_padding.dart';
import 'package:wandertrip/ui/shared/app_spacing.dart';
import 'package:wandertrip/ui/views/onboarding/walkthrough/walkthrough_viewmodel.dart';
import 'package:wandertrip/ui/widgets/app_button.dart';
import 'package:wandertrip/ui/widgets/app_stepindicator.dart';
import 'package:wandertrip/ui/widgets/app_walkthroughbutton.dart';
import 'package:wandertrip/ui/widgets/app_walkthroughtext.dart';

class WalkthroughView extends StatelessWidget {
  const WalkthroughView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WalkthroughViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              PageView(
                controller: model.pageController,
                onPageChanged: (index) {
                  model.onPageChanged(index);
                },
                children: List.generate(
                    walkthroughImages.length,
                    (index) => Stack(
                          children: [
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.kWhiteColor,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        walkthroughImages[model.currentIndex]),
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.6),
                                        BlendMode.darken),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                            BackdropFilter(
                              filter: ImageFilter.blur(
                                  sigmaX: 0.1,
                                  sigmaY:
                                      0.1), // Adjust the sigmaX and sigmaY values for the desired blur effect
                              child: Container(
                                color: AppColors.kSecondaryColor.withOpacity(
                                    0.1), // Adjust the opacity and color to achieve the desired effect
                              ),
                            ),
                          ],
                        )),
              ),
              Column(
                children: [
                  AppSpacing.verticalSpaceMini,
                  AppStepIndicator(
                    currentIndex: model.currentIndex,
                    length: walkthroughImages.length,
                  ),
                  model.currentIndex == 2
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppButton(
                              buttonIcon: Padding(
                                padding: AppPadding.kEdgeInsetsHorizontalTiny,
                                child: Text(
                                  "Skip",
                                  style: GoogleFonts.montserrat(
                                    height: 1.5,
                                    fontSize: 14,
                                    color: AppColors.kWhiteColor,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              onTap: () => model.skipWalkthrough(),
                            ),
                          ],
                        ),
                  AppSpacing.distinctVerticalSpace,
                  AppWalkthroughText(
                    index: model.currentIndex,
                  ),
                  AppWalkthroughButton(
                    index: model.currentIndex,
                    onTapNext: () => model.nextPage(),
                    onTapPrev: () => model.previousPage(),
                    getStarted: () => model.getStarted(),
                  ),
                  AppSpacing.verticalSpaceMini,
                ],
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => WalkthroughViewModel(),
    );
  }
}
