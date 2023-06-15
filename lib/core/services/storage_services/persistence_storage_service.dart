import 'package:wandertrip/core/constants/hive_box.dart';
import 'package:wandertrip/core/services/storage_services/local_storage_service.dart';

const String _hasSeenOnboardingKey = 'hasSeenOnboardingKey';
const String _hasSignedUpKey = 'hasSignedUpKey';
const String _isLoggedInKey = 'isLoggedInKey';

class PersistentStorageService extends LocalStorageService {
  PersistentStorageService() : super(persistBox, 'PersistentStorageService');

  void saveOnboardingStatus(bool value) =>
      saveData(_hasSeenOnboardingKey, value);
  bool? getOnboardingStatus() => getData(_hasSeenOnboardingKey);

  void saveSignUpStatus(bool value) => saveData(_hasSignedUpKey, value);
  bool? getSignUpStatus() => getData(_hasSignedUpKey);

  void saveLoginStatus(bool value) => saveData(_isLoggedInKey, value);
  bool? getLoginStatus() => getData(_isLoggedInKey);
}
