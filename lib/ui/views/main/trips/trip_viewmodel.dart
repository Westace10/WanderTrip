import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wandertrip/app/app.locator.dart';
import 'package:wandertrip/app/app.logger.dart';
import 'package:wandertrip/core/models/countries_model.dart';
import 'package:wandertrip/core/services/api_services/countries_services.dart';
import 'package:wandertrip/core/services/api_services/google_places_api.dart';
import 'package:wandertrip/ui/views/main/discover/discover_viewmodel.dart';

class TripViewModel extends BaseViewModel {
  final log = getLogger("DiscoverViewModel");
  final _navigationService = locator<NavigationService>();
  final _appGoogleApi = AppGoogleAPI();
  final _appCountriesServices = AppCountriesServices();

  init(BuildContext context) async {
    await _discoverModel.init(context);
    notifyListeners();
  }

  DiscoverViewModel _discoverModel = DiscoverViewModel();
  DiscoverViewModel get discoverModel => _discoverModel;
}
