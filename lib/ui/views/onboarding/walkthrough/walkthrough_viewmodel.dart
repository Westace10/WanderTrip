import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wandertrip/app/app.locator.dart';
import 'package:wandertrip/app/app.logger.dart';
import 'package:wandertrip/app/app.router.dart';

class WalkthroughViewModel extends BaseViewModel {
  final log = getLogger("WalkthroughViewModel");
  final _navigationService = locator<NavigationService>();

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final PageController _controller = PageController();
  PageController get pageController => _controller;

  onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  nextPage() {
    _controller.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn);
  }

  previousPage() {
    _controller.previousPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn);
  }

  skipWalkthrough() {
    _controller.jumpToPage(2);
    _currentIndex = 2;
    notifyListeners();
  }

  getStarted() {
    _navigationService.navigateTo(Routes.signupView);
  }
}
