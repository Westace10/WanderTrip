// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i11;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i13;
import 'package:wandertrip/core/models/countries_model.dart' as _i12;
import 'package:wandertrip/ui/views/authentication/forgot_password/forgot_password_view.dart'
    as _i6;
import 'package:wandertrip/ui/views/authentication/login/login_view.dart'
    as _i5;
import 'package:wandertrip/ui/views/authentication/otp_verification/otp_verification_view.dart'
    as _i7;
import 'package:wandertrip/ui/views/features/app_details_page/app_details_page_view.dart'
    as _i10;
import 'package:wandertrip/ui/views/features/app_list_page/app_list_page_view.dart'
    as _i9;
import 'package:wandertrip/ui/views/main/main_view.dart' as _i8;
import 'package:wandertrip/ui/views/onboarding/signup/signup_view.dart' as _i4;
import 'package:wandertrip/ui/views/onboarding/walkthrough/walkthrough_view.dart'
    as _i3;
import 'package:wandertrip/ui/views/startup/startup_view.dart' as _i2;

class Routes {
  static const startupView = '/';

  static const walkthroughView = '/walkthrough-view';

  static const signupView = '/signup-view';

  static const loginView = '/login-view';

  static const forgotPasswordView = '/forgot-password-view';

  static const otpView = '/otp-view';

  static const mainView = '/main-view';

  static const appListPage = '/app-list-page';

  static const appDetailsPage = '/app-details-page';

  static const all = <String>{
    startupView,
    walkthroughView,
    signupView,
    loginView,
    forgotPasswordView,
    otpView,
    mainView,
    appListPage,
    appDetailsPage,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.walkthroughView,
      page: _i3.WalkthroughView,
    ),
    _i1.RouteDef(
      Routes.signupView,
      page: _i4.SignupView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i5.LoginView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i6.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.otpView,
      page: _i7.OtpView,
    ),
    _i1.RouteDef(
      Routes.mainView,
      page: _i8.MainView,
    ),
    _i1.RouteDef(
      Routes.appListPage,
      page: _i9.AppListPage,
    ),
    _i1.RouteDef(
      Routes.appDetailsPage,
      page: _i10.AppDetailsPage,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.WalkthroughView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i3.WalkthroughView(),
        settings: data,
      );
    },
    _i4.SignupView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i4.SignupView(),
        settings: data,
      );
    },
    _i5.LoginView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i5.LoginView(),
        settings: data,
      );
    },
    _i6.ForgotPasswordView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i6.ForgotPasswordView(),
        settings: data,
      );
    },
    _i7.OtpView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i7.OtpView(),
        settings: data,
      );
    },
    _i8.MainView: (data) {
      final args = data.getArgs<MainViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i8.MainView(key: args.key, pageIndex: args.pageIndex),
        settings: data,
      );
    },
    _i9.AppListPage: (data) {
      final args = data.getArgs<AppListPageArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i9.AppListPage(countries: args.countries),
        settings: data,
      );
    },
    _i10.AppDetailsPage: (data) {
      final args = data.getArgs<AppDetailsPageArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i10.AppDetailsPage(
            key: args.key, from: args.from, countryInfo: args.countryInfo),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class MainViewArguments {
  const MainViewArguments({
    this.key,
    required this.pageIndex,
  });

  final _i11.Key? key;

  final int pageIndex;

  @override
  String toString() {
    return '{"key": "$key", "pageIndex": "$pageIndex"}';
  }

  @override
  bool operator ==(covariant MainViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.pageIndex == pageIndex;
  }

  @override
  int get hashCode {
    return key.hashCode ^ pageIndex.hashCode;
  }
}

class AppListPageArguments {
  const AppListPageArguments({required this.countries});

  final List<_i12.CountriesModel> countries;

  @override
  String toString() {
    return '{"countries": "$countries"}';
  }

  @override
  bool operator ==(covariant AppListPageArguments other) {
    if (identical(this, other)) return true;
    return other.countries == countries;
  }

  @override
  int get hashCode {
    return countries.hashCode;
  }
}

class AppDetailsPageArguments {
  const AppDetailsPageArguments({
    this.key,
    required this.from,
    this.countryInfo,
  });

  final _i11.Key? key;

  final String from;

  final _i12.CountriesModel? countryInfo;

  @override
  String toString() {
    return '{"key": "$key", "from": "$from", "countryInfo": "$countryInfo"}';
  }

  @override
  bool operator ==(covariant AppDetailsPageArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.from == from &&
        other.countryInfo == countryInfo;
  }

  @override
  int get hashCode {
    return key.hashCode ^ from.hashCode ^ countryInfo.hashCode;
  }
}

extension NavigatorStateExtension on _i13.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWalkthroughView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.walkthroughView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOtpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.otpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMainView({
    _i11.Key? key,
    required int pageIndex,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mainView,
        arguments: MainViewArguments(key: key, pageIndex: pageIndex),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAppListPage({
    required List<_i12.CountriesModel> countries,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.appListPage,
        arguments: AppListPageArguments(countries: countries),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAppDetailsPage({
    _i11.Key? key,
    required String from,
    _i12.CountriesModel? countryInfo,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.appDetailsPage,
        arguments: AppDetailsPageArguments(
            key: key, from: from, countryInfo: countryInfo),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWalkthroughView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.walkthroughView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOtpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.otpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMainView({
    _i11.Key? key,
    required int pageIndex,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.mainView,
        arguments: MainViewArguments(key: key, pageIndex: pageIndex),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAppListPage({
    required List<_i12.CountriesModel> countries,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.appListPage,
        arguments: AppListPageArguments(countries: countries),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAppDetailsPage({
    _i11.Key? key,
    required String from,
    _i12.CountriesModel? countryInfo,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.appDetailsPage,
        arguments: AppDetailsPageArguments(
            key: key, from: from, countryInfo: countryInfo),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
