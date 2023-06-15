import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';
// import 'package:wandertrip/app/app.locator.dart';
import 'package:wandertrip/app/app.logger.dart';

class MainViewModel extends BaseViewModel {
  final log = getLogger("MainViewModel");
  // final _navigationService = locator<NavigationService>();

  final PageController _controller = PageController();
  PageController get pageController => _controller;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
