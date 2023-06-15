import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wandertrip/app/app.locator.dart';
import 'package:wandertrip/app/app.logger.dart';
import 'package:wandertrip/app/app.router.dart';
import 'package:wandertrip/core/constants/app_credentials.dart';
import 'package:wandertrip/core/models/countries_model.dart';
import 'package:wandertrip/core/services/api_services/countries_services.dart';
import 'package:wandertrip/core/services/api_services/google_places_api.dart';
import 'package:wandertrip/core/services/global_variables.dart/countries.dart';

class DiscoverViewModel extends BaseViewModel {
  final log = getLogger("DiscoverViewModel");
  final _navigationService = locator<NavigationService>();
  final _appGoogleApi = AppGoogleAPI();
  final _appCountriesServices = AppCountriesServices();
  Client client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject(appWriteProjectID)
      .setSelfSigned();

  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  List<String> _suggestions = ["Apple", "Pineapple"];
  List<String> get suggestions => _suggestions;

  List<String> _suggestion = [];
  List<String> get suggestion => _suggestion;

  List<String>? _localImages = [];
  List<String>? get localImages => _localImages;

  List<String>? _localTitle = [];
  List<String>? get localTitle => _localTitle;

  List<String>? _localSubtitle = [];
  List<String>? get localSubtitle => _localSubtitle;

  List<CountriesModel> _asia = [];
  List<CountriesModel> get asia => _asia;

  List<CountriesModel> _africa = [];
  List<CountriesModel> get africa => _africa;

  List<CountriesModel> _northAmerica = [];
  List<CountriesModel> get northAmerica => _northAmerica;

  List<CountriesModel> _southAmerica = [];
  List<CountriesModel> get southAmerica => _southAmerica;

  List<CountriesModel> _antarctica = [];
  List<CountriesModel> get antarctica => _antarctica;

  List<CountriesModel> _europe = [];
  List<CountriesModel> get europe => _europe;

  List<CountriesModel> _australia = [];
  List<CountriesModel> get australia => _australia;

  List<CountriesModel> _oceania = [];
  List<CountriesModel> get oceania => _oceania;

  List<CountriesModel> _allCountries = [];
  List<CountriesModel> get allCountries => _allCountries;

  List<CountriesModel> _localityInfo = [];
  List<CountriesModel> get localityInfo => _localityInfo;

  String _currentAddress = "";
  String get currentAddress => _currentAddress;

  String _name = "";
  String get name => _name;

  String _email = "";
  String get email => _email;

  String _phone = "";
  String get phone => _phone;

  String _location = "";
  String get location => _location;

  bool _showSearch = false;
  bool get showSearch => _showSearch;

  goBack() {
    _navigationService.back();
  }

  goListPage({int? index}) {
    _navigationService.navigateTo(
      Routes.appListPage,
      arguments: AppListPageArguments(
        countries: index == 0
            ? CountriesGV.africanCountries
            : index == 1
                ? CountriesGV.asianCountries
                : index == 2
                    ? CountriesGV.antarcticanCountries
                    : index == 3
                        ? CountriesGV.northAmericanCountries
                        : index == 4
                            ? CountriesGV.southAmericanCountries
                            : index == 5
                                ? CountriesGV.australianCountries
                                : index == 6
                                    ? CountriesGV.europeanCountries
                                    : CountriesGV.allCountries,
      ),
    );
  }

  goDetailPage(CountriesModel countryInfo) {
    _navigationService.navigateTo(
      Routes.appDetailsPage,
      arguments: AppDetailsPageArguments(
        from: "discover",
        countryInfo: countryInfo,
      ),
    );
  }

  init(BuildContext context) async {
    getCurrentAddress();
    getUser();
    if (CountriesGV.allCountries.isEmpty) {
      setBusy(true);
      await getCountriesList(context);
      setBusy(false);
    } else {
      await getCountriesList(context);
      // log.v(CountriesGV.allCountries);
      // log.v(CountriesGV.africanCountries);
      // log.v(_allCountries);
      // log.v(_allCountries);
    }
  }

  Future getUser() async {
    try {
      final account = Account(client);
      final user = await account.get();
      _name = user.name;
      CountriesGV.username = user.name;
      _email = user.email;
      CountriesGV.useremail = user.email;
      _location = _currentAddress;
      CountriesGV.userlocation = _currentAddress;
      notifyListeners();
      return user;
    } on AppwriteException {
      rethrow;
    }
  }

  getCountriesList(BuildContext context) async {
    _allCountries = await _appCountriesServices.getCountryList(context);
    _africa.clear();
    _asia.clear();
    _antarctica.clear();
    _northAmerica.clear();
    _southAmerica.clear();
    _australia.clear();
    _oceania.clear();
    _europe.clear();
    await CountriesGV.resetGlobalVariables();
    CountriesGV.allCountries.addAll(_allCountries);
    CountriesGV.allCountries.sort(
      (a, b) => a.name!.common!.compareTo(b.name!.common!),
    );
    for (var country in _allCountries) {
      if (country.continents![0].toLowerCase() == "africa") {
        _africa.add(country);
        CountriesGV.africanCountries.add(country);
        CountriesGV.africanCountries.sort(
          (a, b) => a.name!.common!.compareTo(b.name!.common!),
        );
      }
      if (country.continents![0].toLowerCase() == "asia") {
        _asia.add(country);
        CountriesGV.asianCountries.add(country);
        CountriesGV.asianCountries.sort(
          (a, b) => a.name!.common!.compareTo(b.name!.common!),
        );
      }
      if (country.continents![0].toLowerCase() == "antarctica") {
        _antarctica.add(country);
        CountriesGV.antarcticanCountries.add(country);
        CountriesGV.antarcticanCountries.sort(
          (a, b) => a.name!.common!.compareTo(b.name!.common!),
        );
      }
      if (country.continents![0].toLowerCase() == "north america") {
        _northAmerica.add(country);
        CountriesGV.northAmericanCountries.add(country);
        CountriesGV.northAmericanCountries.sort(
          (a, b) => a.name!.common!.compareTo(b.name!.common!),
        );
      }
      if (country.continents![0].toLowerCase() == "oceania") {
        _australia.add(country);
        CountriesGV.australianCountries.add(country);
        CountriesGV.australianCountries.sort(
          (a, b) => a.name!.common!.compareTo(b.name!.common!),
        );
      }
      if (country.continents![0].toLowerCase() == "south america") {
        _southAmerica.add(country);
        CountriesGV.southAmericanCountries.add(country);
        CountriesGV.southAmericanCountries.sort(
          (a, b) => a.name!.common!.compareTo(b.name!.common!),
        );
      }
      if (country.continents![0].toLowerCase() == "europe") {
        _europe.add(country);
        CountriesGV.europeanCountries.add(country);
        CountriesGV.europeanCountries.sort(
          (a, b) => a.name!.common!.compareTo(b.name!.common!),
        );
      }
    }
    await _appGoogleApi.convertPositionToAddress().then((value) async {
      _localityInfo.clear();
      _localImages!.clear();
      _localTitle!.clear();
      _localSubtitle!.clear();
      await CountriesGV.resetLocalityGlobalVariables();
      _localityInfo.add(_allCountries.firstWhere((element) =>
          element.name!.common.toString().toLowerCase() ==
          value[0].country.toString().toLowerCase()));
      CountriesGV.locality.addAll(_localityInfo);
      _localImages = [
        _localityInfo[0].flags!.svg.toString(),
        _localityInfo[0].coatOfArms!.svg.toString(),
        _localityInfo[0].maps!.googleMaps.toString(),
      ];
      CountriesGV.localityImage.addAll(_localImages!.toList());
      _localTitle = [
        _localityInfo[0].name!.common.toString(),
        "Coat of Arms",
        "Map"
      ];
      CountriesGV.localityTitle.addAll(_localTitle!.toList());
      _localSubtitle = [
        _localityInfo[0].subregion.toString(),
        "",
        "Lat. ${_localityInfo[0].latlng![0].toString()}, Lon. ${_localityInfo[0].latlng![1].toString()},",
      ];
      CountriesGV.localitySubtitle.addAll(_localSubtitle!.toList());
    });
    log.v("$_localityInfo <<<<<<<<<<<<<<");
    notifyListeners();
  }

  getCurrentAddress() async {
    final locationPerm = await checkLocationPermissions();
    if (locationPerm) {
      _currentAddress =
          await _appGoogleApi.convertPositionToAddress().then((value) {
        log.v("$value <<<<<<<<<<<");
        var currentAddress =
            '${value[0].administrativeArea}, ${value[0].country}';
        return currentAddress;
      });
    } else {
      _currentAddress = "I can't see you!";
      return _currentAddress;
    }
    notifyListeners();
  }

  convertPhotoRefs() async {
    final locationPerm = await checkLocationPermissions();
    if (locationPerm) {
      _currentAddress =
          await _appGoogleApi.convertPositionToAddress().then((value) {
        log.v("$value <<<<<<<<<<<");
        var currentAddress =
            '${value[0].administrativeArea}, ${value[0].country}';
        return currentAddress;
      });
    } else {
      _currentAddress = "I can't see you!";
      return _currentAddress;
    }
    notifyListeners();
  }

  onSearchTextChanged(String value) {
    log.v(_suggestions);
    _suggestions = filterSuggestions(value);
    notifyListeners();
  }

  onFilterTextChanged(String value) async {
    log.v(value);
    final resp = await _appGoogleApi.searchPlaces(value);
    log.v(resp);
    // _suggestions = filterSuggestions(value);
    notifyListeners();
  }

  checkLocationPermissions() async {
    final permResp = await _appGoogleApi.checkLocationPermissions();
    if (permResp) {
      _showSearch = true;
    } else {
      _showSearch = false;
    }
    notifyListeners();
    return permResp;
  }

  getTrendingPlaces() async {
    final resp = await _appGoogleApi.getTrendingPlaces();
    log.v(resp);

    notifyListeners();
  }

  List<String> filterSuggestions(String query) {
    log.v(_suggestions);
    notifyListeners();
    return _suggestions;
  }
}
