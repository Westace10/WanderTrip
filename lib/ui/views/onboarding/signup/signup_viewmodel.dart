import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wandertrip/app/app.locator.dart';
import 'package:wandertrip/app/app.logger.dart';
import 'package:wandertrip/app/app.router.dart';
import 'package:wandertrip/core/services/api_services/api.dart';
import 'package:wandertrip/core/utils/app_input_validation.dart';

class SignupViewModel extends BaseViewModel {
  final log = getLogger("SignupViewModel");
  final _navigationService = locator<NavigationService>();

  final _validation = AppInputValidation();
  final _apiServices = AppWriteApiServices();

  bool _obscureText = false;
  bool get obscureText => _obscureText;

  bool _obscureConfirmText = false;
  bool get obscureConfirmText => _obscureConfirmText;

  String _emailErrorMessage = "";
  String get emailErrorMessage => _emailErrorMessage;

  String _passwordErrorMessage = "";
  String get passwordErrorMessage => _passwordErrorMessage;

  String _confirmPasswordErrorMessage = "";
  String get confirmPasswordErrorMessage => _confirmPasswordErrorMessage;

  String _firstnameErrorMessage = "";
  String get firstnameErrorMessage => _firstnameErrorMessage;

  String _lastnameErrorMessage = "";
  String get lastnameErrorMessage => _lastnameErrorMessage;

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _firstnameController = TextEditingController();
  TextEditingController get firstnameController => _firstnameController;

  final TextEditingController _lastnameController = TextEditingController();
  TextEditingController get lastnameController => _lastnameController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  onObscureClicked() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  onObscureConfirmClicked() {
    _obscureConfirmText = !_obscureConfirmText;
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

  onConfirmPasswordChanged(
    String confirmPassword,
    String actualPassword,
  ) {
    final validationResp = _validation.validateConfirmPasswordInput(
        confirmPassword, actualPassword);
    if (validationResp != null) {
      _confirmPasswordErrorMessage = validationResp;
      notifyListeners();
    } else {
      _confirmPasswordErrorMessage = "";
      notifyListeners();
    }
  }

  onFirstnameChanged(String value) {
    final validationResp = _validation.validateFirstnameInput(value);
    if (validationResp != null) {
      _firstnameErrorMessage = validationResp;
      notifyListeners();
    } else {
      _firstnameErrorMessage = "";
      notifyListeners();
    }
  }

  onLastnameChanged(String value) {
    final validationResp = _validation.validateLastnameInput(value);
    if (validationResp != null) {
      _lastnameErrorMessage = validationResp;
      notifyListeners();
    } else {
      _lastnameErrorMessage = "";
      notifyListeners();
    }
  }

  goToLogin() {
    _navigationService.navigateTo(Routes.loginView);
  }

  goToDashboard({int? pageIndex}) {
    _navigationService.clearStackAndShow(Routes.mainView,
        arguments: MainViewArguments(pageIndex: pageIndex ?? 0));
  }

  createProfile() {}

  createUserAccount() async {
    setBusy(true);
    try {
      if (_emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty &&
          _firstnameController.text.isNotEmpty &&
          _lastnameController.text.isNotEmpty) {
        final response = await _apiServices.createAccount(
          _emailController.text,
          _passwordController.text,
          "${firstnameController.text}" "${lastnameController.text}",
        );
        if (response.runtimeType != String) {
          try {
            await _apiServices.addUserProfile(bio: "", imgId: "");
            setBusy(false);
          } catch (e) {
            log.v(e);
          }
          goToDashboard();
        } else {
          setBusy(false);
          Fluttertoast.showToast(
            msg: "Account creation was not successful",
            toastLength: Toast.LENGTH_LONG,
          );
        }
      }
      setBusy(false);
      onEmailChanged(_emailController.text);
      onPasswordChanged(_passwordController.text);
      onConfirmPasswordChanged(
          _confirmPasswordController.text, _passwordController.text);
      onFirstnameChanged(_firstnameController.text);
      onLastnameChanged(_lastnameController.text);
    } catch (e) {
      setBusy(false);
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
