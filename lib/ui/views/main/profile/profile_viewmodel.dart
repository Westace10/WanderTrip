import 'package:appwrite/appwrite.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wandertrip/app/app.locator.dart';
import 'package:wandertrip/app/app.logger.dart';
import 'package:wandertrip/app/app.router.dart';
import 'package:wandertrip/core/constants/app_credentials.dart';
import 'package:wandertrip/core/services/api_services/api.dart';
import 'package:wandertrip/core/services/global_variables.dart/countries.dart';
import 'package:wandertrip/core/utils/app_input_validation.dart';
import 'package:wandertrip/ui/views/main/discover/discover_viewmodel.dart';

class ProfileViewModel extends BaseViewModel {
  Client client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject(appWriteProjectID)
      .setSelfSigned();

  final log = getLogger("ProfileViewModel");
  final _navigationService = locator<NavigationService>();

  final _validation = AppInputValidation();
  final _apiServices = AppWriteApiServices();
  final _appWriteCountriesServices = AppWriteApiServices();

  init() async {
    // setBusy(true);
    // await getUser();
    // setBusy(false);
  }

  goToLogin() {
    _navigationService.clearStackAndShow(Routes.loginView);
  }

  logOut() async {
    setBusy(true);
    try {
      await _apiServices.logOut().then(
            (value) => goToLogin(),
          );
      await CountriesGV.resetGlobalVariables();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
