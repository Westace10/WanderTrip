import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wandertrip/app/app.locator.dart';
import 'package:wandertrip/app/app.logger.dart';
import 'package:wandertrip/core/services/api_services/api.dart';
import 'package:wandertrip/core/utils/app_input_validation.dart';

class CreateProfileViewModel extends BaseViewModel {
  final log = getLogger("SignupViewModel");
  final _navigationService = locator<NavigationService>();

  final _validation = AppInputValidation();
  final _apiServices = AppWriteApiServices();

  String _firstNameErrorMessage = "";
  String get firstNameErrorMessage => _firstNameErrorMessage;

  String _lastNameErrorMessage = "";
  String get lastNameErrorMessage => _lastNameErrorMessage;

  String _bioErrorMessage = "";
  String get bioErrorMessage => _bioErrorMessage;

  //  Name Controller
  final TextEditingController _firstNameController = TextEditingController();
  TextEditingController get firstNameController => _firstNameController;

  //  Name Controller
  final TextEditingController _lastNameController = TextEditingController();
  TextEditingController get lastNameController => _lastNameController;

  //  Bio Controller
  final TextEditingController _bioController = TextEditingController();
  TextEditingController get bioController => _bioController;

  //  Form Key to manage state and validate form
  final GlobalKey<FormState> _formKey = GlobalKey();

  final ImagePicker _picker = ImagePicker();

  XFile? _image;
  XFile? get image => _image;

  Future<void> pickImage(ImagePicker picker) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    _image = image;
    log.v(_image!.path);
    notifyListeners();
  }
}
