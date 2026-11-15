import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Screens/Login_Screen.dart';
import 'Login-controller.dart';

class ResetPasswordConttroller extends GetxController {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController coPasswordController = TextEditingController();

  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static Future<void> ResetPassowrd() async {
    String? token = await LoginController.getToken();
    try {
      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse("http://10.156.137.170:8000/api/reset-password");
      Map body = {
        'email': emailController.text,
        'password': passwordController.text,
        'password_confirmation': coPasswordController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        print('dddddddddddddddddddddddddddddddddddddddddddddddddddd');
        Get.off(() => LoginScreen());
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
