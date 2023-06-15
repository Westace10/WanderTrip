import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';
import 'package:wandertrip/ui/views/main/social/social_viewmodel.dart';

class SocialView extends StatelessWidget {
  const SocialView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SocialViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
          child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Social Page"),
            Text(
              "This is a feature that allow users to plan a trip with friends and family",
              textAlign: TextAlign.center,
            ),
            Text("(Coming soon)"),
            Icon(
              Icons.lock_clock,
              size: 42,
              color: AppColors.kSecondaryColor,
            )
          ],
        ),
      )),
      viewModelBuilder: () => SocialViewModel(),
    );
  }
}
