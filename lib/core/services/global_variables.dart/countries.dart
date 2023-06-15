import 'package:wandertrip/core/models/countries_model.dart';

class CountriesGV {
  static List<CountriesModel> allCountries = [];
  static List<CountriesModel> asianCountries = [];
  static List<CountriesModel> africanCountries = [];
  static List<CountriesModel> northAmericanCountries = [];
  static List<CountriesModel> southAmericanCountries = [];
  static List<CountriesModel> antarcticanCountries = [];
  static List<CountriesModel> europeanCountries = [];
  static List<CountriesModel> australianCountries = [];
  static List<CountriesModel> locality = [];
  static List<String> localityImage = [];
  static List<String> localityTitle = [];
  static List<String> localitySubtitle = [];
  static String username = "";
  static String useremail = "";
  static String userlocation = "";

  static Future<void> resetGlobalVariables() async {
    allCountries = [];
    asianCountries = [];
    africanCountries = [];
    northAmericanCountries = [];
    southAmericanCountries = [];
    antarcticanCountries = [];
    europeanCountries = [];
    australianCountries = [];
    username = "";
    useremail = "";
    userlocation = "";
  }

  static Future<void> resetLocalityGlobalVariables() async {
    locality = [];
    localityImage = [];
    localitySubtitle = [];
    localityTitle = [];
  }
}
