import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wandertrip/app/app.locator.dart';
import 'package:wandertrip/app/app.logger.dart';
import 'package:wandertrip/app/app.router.dart';
import 'package:wandertrip/core/services/api_services/api.dart';
import 'package:wandertrip/core/utils/app_input_validation.dart';

class LoginViewModel extends BaseViewModel {
  final log = getLogger("LoginViewModel");
  final _navigationService = locator<NavigationService>();

  final _validation = AppInputValidation();
  final _apiServices = AppWriteApiServices();

  bool _obscureText = false;
  bool get obscureText => _obscureText;

  String _emailErrorMessage = "";
  String get emailErrorMessage => _emailErrorMessage;

  String _passwordErrorMessage = "";
  String get passwordErrorMessage => _passwordErrorMessage;

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  onObscureClicked() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  onEmailChanged(String value) {
    final validationResp = _validation.validateEmailInput(
      value,
    );
    if (validationResp != null) {
      _emailErrorMessage = validationResp;
      notifyListeners();
    } else {
      _emailErrorMessage = "";
      notifyListeners();
    }
  }

  onPasswordChanged(String value) {
    final validationResp = _validation.validatePasswordInput(value);
    if (validationResp != null) {
      _passwordErrorMessage = validationResp;
      notifyListeners();
    } else {
      _passwordErrorMessage = "";
      notifyListeners();
    }
  }

  goToSignUp() {
    _navigationService.navigateTo(Routes.signupView);
  }

  goToDashboard({int? pageIndex}) {
    _navigationService.clearStackAndShow(Routes.mainView,
        arguments: MainViewArguments(pageIndex: pageIndex ?? 0));
  }

  login() async {
    setBusy(true);
    try {
      if (_emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        await _apiServices.loginUser(
          _emailController.text,
          _passwordController.text,
        );
        // if (response.runtimeType != String) {
        setBusy(false);
        goToDashboard();
        // }
        // else {
        //   setBusy(false);
        //   Fluttertoast.showToast(
        //     msg: "Logout was not successful",
        //     toastLength: Toast.LENGTH_LONG,
        //   );
        // }
      }
      setBusy(false);
      onEmailChanged(_emailController.text);
      onPasswordChanged(_passwordController.text);
    } catch (e) {
      setBusy(false);
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
