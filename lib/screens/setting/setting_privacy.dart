import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_fake/screens/auth_page/auth_controller.dart';
import 'package:tiktok_fake/screens/auth_page/login_page.dart';

class SettingPrivacy extends StatefulWidget {
  const SettingPrivacy({Key? key}) : super(key: key);

  @override
  State<SettingPrivacy> createState() => _SettingPrivacyState();
}

class _SettingPrivacyState extends State<SettingPrivacy> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (logic) {
      return Center(
        child: TextButton(
          onPressed: () {
            logic.signOut();
            Get.to(() => LoginPage());
          },
          child: Text('logout'),
        ),
      );
    });
  }
}
