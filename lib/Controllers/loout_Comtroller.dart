import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shcool/Controllers/Login-controller.dart';
import 'package:shcool/onboard/onboard_screen.dart';

class LogOutControllerController extends GetxController {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> LogOut() async {
    String? token = await LoginController.getToken();
    print(token);
    try {
      var headers = {
        'Content-Type': 'application/json;',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse("http://10.156.137.170:8000/api/auth/logout");

      http.Response response = await http.post(url, headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        Get.to(() => OnboardScreen());
      } else {
        throw jsonDecode(response.body)['message'] ?? 'Unknoun Error Occured';
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
