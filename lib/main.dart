import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_fake/AppControl/app.dart';
import 'package:tiktok_fake/firebase_options.dart';
import 'package:tiktok_fake/screens/splash_page/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {});
  initService();

  runApp(const App());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: SplashPage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       home: GetBuilder<AppControl>(
//         builder: (logic) {
//           print("check ${Get.find<AuthController>().user?.uid}");
//           if (logic.isLogin) {
//             return LoginPage();
//           } else {
//             return const NavigatorBottom();
//           }
//         },
//       ),
//       getPages: [
//         GetPage(name: '/', page: () => const HomePage()),
//         GetPage(name: '/navigator', page: () => const NavigatorBottom()),
//         GetPage(name: '/login', page: () => LoginPage()),
//         GetPage(name: '/signUp', page: () => SignUp()),
//         GetPage(name: '/setting_privacy', page: () => const SettingPrivacy()),
//         GetPage(name: '/splash', page: () => const SplashPage()),
//       ],
//     );
//   }
// }
