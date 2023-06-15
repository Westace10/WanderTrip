import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:wandertrip/ui/views/startup/startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      onViewModelReady: (model) => model.init(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child: SvgPicture.asset(
                  "assets/svg/wanderlust_short_logo.svg",
                  height: 120,
                ),
              ),
              SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: SvgPicture.asset(
                    "assets/svg/wanderlust_text_logo.svg",
                    width: 200,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
