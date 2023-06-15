class AppInputValidation {
  String? validateEmailInput(String value) {
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }

    return null;
  }

  String? validatePasswordInput(String value) {
    if (value.isEmpty) {
      return 'Enter a password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain an uppercase letter';
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain a number';
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain a lowercase letter';
    } else if (!value.contains(RegExp(r'[~@#$%^&*_-]'))) {
      return 'Password must contain a special character';
    }

    return null;
  }

  String? validateConfirmPasswordInput(
    String value,
    String password,
  ) {
    if (value.isEmpty) {
      return 'Enter confirm password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain an uppercase letter';
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain a number';
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain a lowercase letter';
    } else if (!value.contains(RegExp(r'[~@#$%^&*_-]'))) {
      return 'Password must contain a special character';
    } else if (value != password) {
      return 'Password did not match';
    }

    return null;
  }

  String? validateFirstnameInput(String value) {
    if (value.isEmpty) {
      return 'Enter your first name';
    }

    return null;
  }

  String? validateLastnameInput(String value) {
    if (value.isEmpty) {
      return 'Enter your last name';
    }

    return null;
  }
}
