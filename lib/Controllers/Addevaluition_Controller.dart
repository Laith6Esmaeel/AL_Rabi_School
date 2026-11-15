import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Login-controller.dart';

class AddevaluitionController extends GetxController {
  static TextEditingController levelController = TextEditingController();
  static TextEditingController interactionController = TextEditingController();
  static TextEditingController behaviorController = TextEditingController();
  static TextEditingController semester1Controller = TextEditingController();
  static TextEditingController semester2Controller = TextEditingController();
  static TextEditingController descriptionController = TextEditingController();

  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static Future<void> Addevaluition(int id) async {
    String? token = await LoginController.getToken();
    try {
      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse("http://10.156.137.170:8000/api/evaluations/${id}");
      Map body = {
        'level': levelController.text,
        'interaction': interactionController.text,
        'behavior': behaviorController.text,
        'semester1': semester1Controller.text,
        'semester2': semester2Controller.text,
        'description': descriptionController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        print('dddddddddddddddddddddddddddddddddddddddddddddddddddd');
        Get.snackbar(
          '',
          'تم ارسال التقييم بنجاح',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          '',
          ' لم تم ارسال التقييم بنجاح',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
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
