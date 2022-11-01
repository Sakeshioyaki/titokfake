import 'package:get/get.dart';
import 'package:tiktok_fake/model/user_model.dart';

class UserController extends GetxController {
  UserModel userModel = UserModel();

  set user(UserModel value) => userModel = value;

  void clear() {
    userModel = UserModel();
    update();
  }
}
