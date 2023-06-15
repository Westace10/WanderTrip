import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wandertrip/app/app.locator.dart';
import 'package:wandertrip/app/app.logger.dart';
import 'package:wandertrip/app/app.router.dart';
import 'package:wandertrip/core/constants/app_constant.dart';
import 'package:wandertrip/core/constants/app_credentials.dart';

class AppGoogleAPI {
  final log = getLogger("AppGoogleAPI");
  final _navigationService = locator<NavigationService>();

  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'content-type': 'application/json',
  }; // header

  static var options = BaseOptions(headers: header, baseUrl: '$googleBaseUrl/');
  Dio dio = Dio(options);

  Future<bool> checkLocationPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        log.v("Location permission is granted");
        return true;
        // Location permission is still denied
      }
    } else {
      return true;
    }
    return false;
  }

  Future<Position> getUserLocation() async {
    try {
      // Check if location services are enabled
      var position = await GeolocatorPlatform.instance.getCurrentPosition(
        locationSettings:
            const LocationSettings(accuracy: LocationAccuracy.best),
      );
      log.v(position);
      return position;
    } catch (e) {
      return Position(
        longitude: 0,
        latitude: 0,
        timestamp: DateTime.now(),
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
      );
    }
  }

  Future<List<Placemark>> convertPositionToAddress() async {
    try {
      final position = await getUserLocation();
      final placemark =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      log.v(placemark);
      return placemark;
    } catch (e) {
      log.v(e);
      return <Placemark>[];
    }
  }

  // Future<List<String>> convertPhotoRefs() async {
  //   try {
  //     final position = await getUserLocation();
  //     final placemark =
  //         await placemarkFromCoordinates(position.latitude, position.longitude);
  //     log.v(placemark);
  //     return placemark;
  //   } catch (e) {
  //     log.v(e);
  //     return <Placemark>[];
  //   }
  // }

  Future<List<String>> getTrendingPlaces() async {
    try {
      var position = await getUserLocation();
      if (position.runtimeType != bool) {
        Response<String> response = await dio.get(
          "maps/api/place/nearbysearch/json?key=$googleApiKey&location=${position.latitude},${position.longitude}&radius=10000&type=art_gallery",
        );
        log.v(response);
      }

      // if (response.statusCode == 200) {
      //   final data = json.decode(response.data.toString());
      //   List<String> cities = [];

      //   for (var result in data['results']) {
      //     for (var component in result['address_components']) {
      //       if (component['types'].contains('country')) {
      //         String cityName = component['long_name'];
      //         cities.add(cityName);
      //       }
      //     }
      //   }

      //   return cities;
      // }
      return [];
    } on DioError catch (d) {
      if (d.response != null) {
        log.v(
          "Dio Error with Status Code ${d.response!.statusCode} and Msg ${d.response!.data}",
        );
        if (d.response!.statusCode == 403) {
          var box = await Hive.openBox('login');
          box.clear();
          _navigationService.clearStackAndShow(Routes.loginView);
          Fluttertoast.showToast(
              msg: "Session time out! Please login again...");
        }
      }
      return [];
    } catch (e) {
      log.v(
        "Fatal Error in Getting images ${e.toString()}",
      );
      Fluttertoast.showToast(msg: "Failed to fetch images");
      return [];
    }
  }

  Future<List<String>> searchPlaces(String query) async {
    try {
      Response<String> response = await dio.get(
        "maps/api/place/textsearch/json?query=$query&type=tourist_attraction&key=$googleApiKey",
      );
      log.v(response);
      // if (response.statusCode == 200) {
      //   final data = json.decode(response.data.toString());
      //   List<String> cities = [];

      //   for (var result in data['results']) {
      //     for (var component in result['address_components']) {
      //       if (component['types'].contains('country')) {
      //         String cityName = component['long_name'];
      //         cities.add(cityName);
      //       }
      //     }
      //   }

      //   return cities;
      // }
      return [];
    } on DioError catch (d) {
      if (d.response != null) {
        log.v(
          "Dio Error with Status Code ${d.response!.statusCode} and Msg ${d.response!.data}",
        );
        if (d.response!.statusCode == 403) {
          var box = await Hive.openBox('login');
          box.clear();
          _navigationService.clearStackAndShow(Routes.loginView);
          Fluttertoast.showToast(
              msg: "Session time out! Please login again...");
        }
      }
      return [];
    } catch (e) {
      log.v(
        "Fatal Error in Getting images ${e.toString()}",
      );
      Fluttertoast.showToast(msg: "Failed to fetch images");
      return [];
    }
  }

  Future<List<String>> searchImagesByCoordinates(
      double latitude, double longitude) async {
    try {
      Response<String> response = await dio.get(
        "maps/api/geocode/json?latlng=$latitude,$longitude&key=$googleApiKey",
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.data.toString());
        final address = data['results'][0]['formatted_address'];

        Response<String> responseImages = await dio.get(
          "customsearch/v1?key=$googleApiKey&cx=$googleSearchID&q=$address&searchType=image",
        );

        final imagesData = json.decode(responseImages.data.toString());

        List<String> imageUrls = [];

        for (var result in imagesData['items']) {
          String imageUrl = result['link'];
          imageUrls.add(imageUrl);
        }

        return imageUrls;
      }
      return [];
    } on DioError catch (d) {
      if (d.response != null) {
        log.v(
          "Dio Error with Status Code ${d.response!.statusCode} and Msg ${d.response!.data}",
        );
        if (d.response!.statusCode == 403) {
          var box = await Hive.openBox('login');
          box.clear();
          _navigationService.clearStackAndShow(Routes.loginView);
          Fluttertoast.showToast(
              msg: "Session time out! Please login again...");
        }
      }
      return [];
    } catch (e) {
      log.v(
        "Fatal Error in Getting images ${e.toString()}",
      );
      Fluttertoast.showToast(msg: "Failed to fetch images");
      return [];
    }
  }

  Future<List<String>> getCitiesAroundLocation(
      double latitude, double longitude) async {
    try {
      Response<String> response = await dio.get(
        "maps/api/geocode/json?latlng=$latitude,$longitude&key=$googleApiKey",
      );
      log.v(response);
      if (response.statusCode == 200) {
        final data = json.decode(response.data.toString());
        List<String> cities = [];

        for (var result in data['results']) {
          for (var component in result['address_components']) {
            if (component['types'].contains('country')) {
              String cityName = component['long_name'];
              cities.add(cityName);
            }
          }
        }

        return cities;
      }
      return [];
    } on DioError catch (d) {
      if (d.response != null) {
        log.v(
          "Dio Error with Status Code ${d.response!.statusCode} and Msg ${d.response!.data}",
        );
        if (d.response!.statusCode == 403) {
          var box = await Hive.openBox('login');
          box.clear();
          _navigationService.clearStackAndShow(Routes.loginView);
          Fluttertoast.showToast(
              msg: "Session time out! Please login again...");
        }
      }
      return [];
    } catch (e) {
      log.v(
        "Fatal Error in Getting images ${e.toString()}",
      );
      Fluttertoast.showToast(msg: "Failed to fetch images");
      return [];
    }
  }
}
