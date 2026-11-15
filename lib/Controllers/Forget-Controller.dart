import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Screens/Forget_check.dart';

class ForgetPasswordController extends GetxController {
  static TextEditingController emailController = TextEditingController();

  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static Future<void> check() async {
    try {
      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      };
      var url = Uri.parse("http://10.156.137.170:8000/api/forgot-password");
      Map body = {
        'email': emailController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        Get.off(() => Forget_check());
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
