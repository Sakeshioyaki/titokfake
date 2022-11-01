import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_fake/common/app_colors.dart';
import 'package:tiktok_fake/common/app_images.dart';
import 'package:tiktok_fake/common/app_text_styles.dart';
import 'package:tiktok_fake/screens/splash_page/splash_vm.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  SplashVm vm = Get.put<SplashVm>(SplashVm());

  @override
  void initState() {
    super.initState();
    vm.init();
  }

  @override
  void dispose() {
    Get.delete<SplashVm>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.blackAuth,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.icTiktok,
                width: 150,
              ),
              Text(
                'Tiktok',
                style: AppTextStyle.textWhiterS46Bold.copyWith(
                  letterSpacing: 1,
                  height: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
