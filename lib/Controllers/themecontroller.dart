import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ThemeController extends GetxController {
  void toggleTheme();
  ThemeMode get currentTheme;
}

class ThemeControllerImp extends ThemeController {
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  @override
  void onInit() {
    super.onInit();

    if (Get.isDarkMode) {
      themeMode.value = ThemeMode.dark;
    } else {
      themeMode.value = ThemeMode.light;
    }

    // Get.changeThemeMode(themeMode.value);
    
  }

  @override
  void toggleTheme() {
    themeMode.value =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    Get.changeThemeMode(themeMode.value);
  }

  @override
  ThemeMode get currentTheme => themeMode.value;
}
