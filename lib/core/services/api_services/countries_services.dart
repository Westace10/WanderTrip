import 'package:flutter/material.dart';
import 'package:wandertrip/app/app.logger.dart';
import 'package:wandertrip/core/models/countries_model.dart';

class AppCountriesServices {
  final log = getLogger("DiscoverViewModel");
  Future<List<CountriesModel>> getCountryList(BuildContext context) async {
    try {
      List<CountriesModel> jsonResult = [];
      String data = await DefaultAssetBundle.of(context)
          .loadString("assets/jsons/countries.json");
      jsonResult = countriesModelFromJson(data);
      return jsonResult;
    } catch (e) {
      log.v(e);
      return [];
    }
  }
}
