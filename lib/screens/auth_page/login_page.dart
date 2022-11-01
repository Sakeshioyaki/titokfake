import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_fake/common/app_colors.dart';
import 'package:tiktok_fake/common/app_text_styles.dart';
import 'package:tiktok_fake/screens/auth_page/auth_controller.dart';
import 'package:tiktok_fake/screens/auth_page/sign_up.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: GetBuilder<AuthController>(builder: (logic) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Column(
              //   children: [
              //     // Image.asset(
              //     //   'assets/post-it.png',
              //     //   height: 150,
              //     // ),
              //     const Text(
              //       '',
              //     ),
              //   ],
              // ),
              const SizedBox(height: 80),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.people_alt,
                    size: 30,
                  ),
                  hintText: 'Enter email ...',
                ),
                controller: emailController,
              ),
              logic.statusEmail == ""
                  ? const SizedBox(
                      height: 20,
                    )
                  : SizedBox(
                      height: 20,
                      child: Text(
                        logic.statusEmail,
                        style: AppTextStyle.textGrayS14Semi
                            .copyWith(color: AppColors.redAuth),
                      ),
                    ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    size: 30,
                  ),
                  hintText: 'Enter Password ...',
                ),
                controller: passwordController,
                obscureText: true,
              ),
              logic.statusPassword.isNotEmpty
                  ? SizedBox(
                      height: 20,
                      child: Text(
                        logic.statusPassword,
                        style: AppTextStyle.textGrayS14Semi
                            .copyWith(color: AppColors.redAuth),
                      ),
                    )
                  : const SizedBox(
                      height: 20,
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Not have account yet ? go to ',
                  ),
                  TextButton(
                    child: const Text(
                      'Sign Up',
                    ),
                    onPressed: () {
                      Get.to(SignUp());
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  logic.login(emailController.text, passwordController.text);
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  side: MaterialStateProperty.all(
                    const BorderSide(
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                child: const SizedBox(
                  height: 40,
                  width: 100,
                  child: Center(
                    child: Text(
                      'Login',
                    ),
                  ),
                ),
              ),
              logic.status == "SUCCESS"
                  ? const SizedBox(
                      height: 20,
                    )
                  : SizedBox(
                      height: 20,
                      child: Text(
                        logic.status,
                        style: AppTextStyle.textGrayS14Semi
                            .copyWith(color: AppColors.redAuth),
                      ),
                    ),
            ],
          );
        }),
      ),
    );
  }
}
