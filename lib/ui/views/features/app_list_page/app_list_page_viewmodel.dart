import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wandertrip/app/app.locator.dart';
import 'package:wandertrip/app/app.logger.dart';
import 'package:wandertrip/app/app.router.dart';
import 'package:wandertrip/core/models/countries_model.dart';
import 'package:wandertrip/core/services/api_services/api.dart';

class AppListPageViewModel extends BaseViewModel {
  final log = getLogger("AppListPageViewModel");
  final _navigationService = locator<NavigationService>();
  final _appWriteCountriesServices = AppWriteApiServices();

  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  final List<CountriesModel> _suggestion = [];
  List<CountriesModel> get suggestion => _suggestion;

  goBack() {
    _navigationService.back();
  }

  List<CountriesModel> filterSuggestions(
    String query,
    List<CountriesModel> data,
  ) {
    suggestion.clear();
    suggestion.addAll(data
        .where((element) =>
            element.name!.common!.toLowerCase().contains(query.toLowerCase()))
        .toList()
        .toSet());
    log.v(_suggestion);
    notifyListeners();
    return _suggestion;
  }

  goDetailPage(CountriesModel countryInfo) {
    _navigationService.navigateTo(
      Routes.appDetailsPage,
      arguments: AppDetailsPageArguments(
        from: countryInfo.name!.common!,
        countryInfo: countryInfo,
      ),
    );
  }

  addTofavorite(CountriesModel countryInfo) async {
    await _appWriteCountriesServices.addFavCountry(
        countryName: countryInfo.name!.common!.toLowerCase());
  }

  getfavorites() {}
}
