import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wandertrip/ui/views/authentication/forgot_password/forgot_passwrd_viewmodel.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
      builder: (context, model, child) => const Scaffold(),
      viewModelBuilder: () => ForgotPasswordViewModel(),
    );
  }
}
