import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wandertrip/core/services/storage_services/persistence_storage_service.dart';
import 'package:wandertrip/ui/views/authentication/forgot_password/forgot_password_view.dart';
import 'package:wandertrip/ui/views/authentication/login/login_view.dart';
import 'package:wandertrip/ui/views/authentication/otp_verification/otp_verification_view.dart';
import 'package:wandertrip/ui/views/features/app_details_page/app_details_page_view.dart';
import 'package:wandertrip/ui/views/features/app_list_page/app_list_page_view.dart';
import 'package:wandertrip/ui/views/main/main_view.dart';
import 'package:wandertrip/ui/views/onboarding/signup/signup_view.dart';
import 'package:wandertrip/ui/views/onboarding/walkthrough/walkthrough_view.dart';
import 'package:wandertrip/ui/views/startup/startup_view.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: StartupView, initial: true),
    AdaptiveRoute(page: WalkthroughView),
    AdaptiveRoute(page: SignupView),
    AdaptiveRoute(page: LoginView),
    AdaptiveRoute(page: ForgotPasswordView),
    AdaptiveRoute(page: OtpView),
    AdaptiveRoute(page: MainView),
    AdaptiveRoute(page: AppListPage),
    AdaptiveRoute(page: AppDetailsPage),
  ],
  dependencies: [
    // Core Services
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),

    // local storage services
    LazySingleton(classType: PersistentStorageService),

    // feature services
  ],
  logger: StackedLogger(),
)
class App {}
