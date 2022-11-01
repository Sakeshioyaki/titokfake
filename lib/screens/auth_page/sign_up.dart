import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_fake/screens/auth_page/auth_controller.dart';
import 'package:tiktok_fake/utils/validate.dart';
import 'package:tiktok_fake/widgets/app_dialog/app_dialog.dart';

class SignUp extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  Image.asset(
                    'assets/post-it.png',
                    height: 150,
                  ),
                  const Text(
                    'Note App',
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.people_alt,
                    size: 30,
                  ),
                  hintText: 'Enter name ...',
                ),
                controller: nameController,
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.mail,
                    size: 30,
                  ),
                  hintText: 'Enter email ...',
                ),
                controller: emailController,
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    size: 30,
                  ),
                  hintText: 'Enter password ...',
                ),
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(
                height: 40,
              ),
              OutlinedButton(
                  onPressed: () {
                    String validatePass = ValidateString.validatePass(
                        pass: passwordController.text,
                        confirmPass: passwordController.text);
                    String validateEmail = ValidateString.validateMail(
                      email: emailController.text,
                    );

                    if (validateEmail != "" || validatePass != "") {
                      AppDialog.messages(message: validatePass + validateEmail);
                    } else {
                      controller.createUser(
                        emailController.text,
                        passwordController.text,
                        nameController.text,
                      );
                    }

                    print(
                        "${nameController.text} - ${emailController.text} - ${passwordController.text}");
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
                        'Sign Up',
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
