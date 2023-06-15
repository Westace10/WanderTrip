import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wandertrip/app/app.locator.dart';
import 'package:wandertrip/app/app.logger.dart';

class AppDetailsPageViewModel extends BaseViewModel {
  final log = getLogger("AppDetailsPageViewModel");
  final _navigationService = locator<NavigationService>();

  goBack() {
    _navigationService.back();
  }
}
