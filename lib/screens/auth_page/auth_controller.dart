import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tiktok_fake/AppControl/app_controll.dart';
import 'package:tiktok_fake/AppControl/user_controller.dart';
import 'package:tiktok_fake/db/db.dart';
import 'package:tiktok_fake/model/user_model.dart';
import 'package:tiktok_fake/screens/auth_page/login_page.dart';
import 'package:tiktok_fake/screens/home_page/navigator_bottom.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  static AuthController instance = Get.find();
  User? firebaseUser;
  User? get user => firebaseUser;
  AppControl appControl = Get.find<AppControl>();
  String statusEmail = "";
  String statusPassword = "";
  String status = "";

  @override
  void onReady() {
    super.onReady();
    firebaseUser = auth.currentUser;
    // setInitialScreen(firebaseUser);
  }

  void setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => const NavigatorBottom());
    }
    print('this cureetn ${this.user?.email}');
  }

  void createUser(
    String email,
    String password,
    String name,
  ) async {
    try {
      print('come to create user ???... ${name}');
      UserCredential authResult = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(
          'creted user  - ${authResult.user?.uid} - ${authResult.user?.email}');
      UserModel _user = UserModel(
        id: authResult.user?.uid,
        name: name,
        email: authResult.user?.email,
      );
      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        Get.back();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
    update();
  }

  void login(String email, password) async {
    print('longingggg.. $email  - $password');
    status = "";
    statusEmail = "";
    statusPassword = "";
    try {
      UserCredential authResult = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      // Get.find<AuthController>().firebaseUser = authResult.user;
      Get.find<UserController>().user =
          await Database().getUser(authResult.user!.uid);
      print("dddd ${authResult.toString()}");
      print('come there ${Get.find<AuthController>().user?.uid}');
      appControl.setIsLogin();
      status = 'SUCCESS';
      print("status ss: ${status}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        statusEmail = 'No user found for that email.';
        print("${e}");
        print("status : ${statusEmail}");
      } else if (e.code == 'wrong-password') {
        statusPassword = 'Wrong password provided for that user.';
        print("status : ${statusPassword}");
        print("${e.code}");
      }
    } catch (e) {
      status = 'Failed with error code: ${e}';
      print("${e}");
      print("status : ${status}");
    }
    update();
  }

  void signOut() async {
    await auth.signOut();
    Get.find<UserController>().clear();
    update();
  }
}
