import 'dart:convert';
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'package:shcool/Screens/Gardian/home_screen.dart';

class LoginController extends GetxController {
  static final TextEditingController emailconroller = TextEditingController();
  static final TextEditingController passwordcontroller =
      TextEditingController();
//
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static Future<void> loginWithPhone() async {
    try {
      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      };
      var url = Uri.parse("http://10.156.137.170:8000/api/auth/login");

      var body = {
        'password': passwordcontroller.text,
        'email': emailconroller.text,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json.isEmpty) {
          throw 'nothing';
        }

        final user = json[0];
        String token = user['token'];
        int id = int.parse(user['id'].toString());
        String role = user['role'];

        final SharedPreferences prefs = await _prefs;
        await prefs.setString('Token', token);
        await prefs.setInt('ID', id);
        await prefs.setString('Role', role);
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

        if (role == 'Teacher') {
          Get.off(() => Home(
                role: 'Teacher',
              ));
        } else if (role == 'Student') {
          Get.off(() => Home(
                role: "Student",
              ));
        } else {
          Get.defaultDialog(
            title: "error",
            middleText: " undfind role : $role",
          );
        }
      } else {
        throw jsonDecode(response.body)['message'] ?? 'Unknown Error Occurred';
      }
    } catch (e) {
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Error'),
            contentPadding: const EdgeInsets.all(20),
            children: [Text(e.toString())],
          );
        },
      );
    }
  }

  static Future<int?> getUserId() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getInt('ID');
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('Token');
  }
}
