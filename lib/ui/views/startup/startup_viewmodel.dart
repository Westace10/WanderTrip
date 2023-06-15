import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wandertrip/app/app.locator.dart';
import 'package:wandertrip/app/app.logger.dart';
import 'package:wandertrip/app/app.router.dart';
import 'package:wandertrip/core/services/storage_services/persistence_storage_service.dart';
// import 'package:wandertrip/app/app.router.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger("StartupViewModel");
  final _navigationService = locator<NavigationService>();
  final _persistentStorageService = PersistentStorageService();

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 5), () async {
      final hasOnBoarded = _persistentStorageService.getOnboardingStatus();
      final hasSignedUp = _persistentStorageService.getSignUpStatus();
      final isLoggedIn = _persistentStorageService.getLoginStatus();
      if (hasOnBoarded != null) {
        if ((hasOnBoarded && hasSignedUp! && isLoggedIn!)) {
          // go to dashboard
        } else if (!hasOnBoarded) {
          // go to walkthrough
          _navigationService.clearStackAndShow(Routes.walkthroughView);
        } else if (!hasSignedUp!) {
          // go to sign up
          _navigationService.clearStackAndShow(Routes.signupView);
        } else if (!isLoggedIn!) {
          // go to login
          _navigationService.clearStackAndShow(Routes.loginView);
        }
      } else {
        _navigationService.clearStackAndShow(Routes.walkthroughView);
      }
    });
  }
}
