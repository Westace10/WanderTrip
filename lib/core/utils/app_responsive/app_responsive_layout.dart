import 'package:flutter/material.dart';

class AppResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  const AppResponsiveLayout(
      {required this.mobileScaffold,
      required this.tabletScaffold,
      required this.desktopScaffold,
      super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return mobileScaffold;
        } else if (constraints.maxWidth < 1100) {
          return tabletScaffold;
        } else {
          return desktopScaffold;
        }
      },
    );
  }
}
