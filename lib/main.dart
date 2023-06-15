import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wandertrip/app/app.locator.dart';
import 'package:wandertrip/app/app.router.dart';
import 'package:wandertrip/core/constants/app_constant.dart';
import 'package:wandertrip/core/services/storage_services/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await setupLocator();
  await openHiveBoxes();
  // await FontLoader('Fellix').load();
  // setupDialogUi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
