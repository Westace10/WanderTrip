import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wandertrip/ui/views/authentication/otp_verification/otp_verification_viewmodel.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OtpViewModel>.reactive(
      builder: (context, model, child) => const Scaffold(),
      viewModelBuilder: () => OtpViewModel(),
    );
  }
}
