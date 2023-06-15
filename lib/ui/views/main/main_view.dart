// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';
import 'package:wandertrip/ui/views/main/discover/discover_view.dart';
import 'package:wandertrip/ui/views/main/main_viewmodel.dart';
import 'package:wandertrip/ui/views/main/profile/profile_view.dart';
import 'package:wandertrip/ui/views/main/social/social_view.dart';
import 'package:wandertrip/ui/views/main/trips/trip_view.dart';
import 'package:wandertrip/ui/widgets/app_bottom_nav.dart';

class MainView extends StatelessWidget {
  int pageIndex;
  MainView({
    super.key,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.kWhiteColor,
          body: PageView(
            controller: model.pageController,
            onPageChanged: (index) {
              model.updateIndex(index);
            },
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              DiscoverView(),
              // TripView(),
              // SocialView(),
              ProfileView(),
            ],
          ),
          bottomNavigationBar: AppBottomNav(
            controller: model.pageController,
            currentIndex: model.currentIndex,
          ),
        ),
      ),
      viewModelBuilder: () => MainViewModel(),
    );
  }
}
