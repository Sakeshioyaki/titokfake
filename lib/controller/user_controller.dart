import 'package:get/get.dart';
import 'package:tiktok_fake/model/user_model.dart';

class UserController extends GetxController {
  final UserModel _userModel = UserModel();

  UserModel get user => _userModel.value;

  set user(UserModel value) => _userModel.value = value;

  void clear() {
    _userModel.value = UserModel();
  }
}
