// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:shcool/locale/locale.dart';
// import 'package:shcool/onboard/onboard_screen.dart';
// import 'package:shcool/theme/theme_data.dart';

// import 'locale/locale_controller.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     MyLocalController controller = Get.put(MyLocalController());
//     return GetMaterialApp(
//       translations: MyLocale(),
//       locale: const Locale('en'),
//       fallbackLocale: const Locale('en'),
//       title: 'school',
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         body: OnboardScreen(),
//       ),
//       theme: lightmood,
//       darkTheme: darkmood,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Services/Get_Notification.dart';

import 'package:shcool/locale/locale.dart';
import 'package:shcool/onboard/onboard_screen.dart';
import 'package:shcool/theme/theme_data.dart';

import 'locale/locale_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocalController controller = Get.put(MyLocalController());

    return GetMaterialApp(
      translations: MyLocale(),
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      title: 'school',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: OnboardScreen(),
      ),
      theme: lightmood,
      darkTheme: darkmood,
    );
  }
}
