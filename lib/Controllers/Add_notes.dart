import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shcool/Controllers/Login-controller.dart';

class AddNotes_Controller extends GetxController {
  static TextEditingController noteController = TextEditingController();
  static TextEditingController typeController = TextEditingController();

  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static Future<void> AddComplaints(int id) async {
    String? token = await LoginController.getToken();
    try {
      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse(
          "http://10.156.137.170:8000/api/teacher/students/${id}/notes");
      Map body = {
        'note': noteController.text,
        'type':typeController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        print('dddddddddddddddddddddddddddddddddddddddddddddddddddd');
          Get.snackbar(
        '',
        'تم ارسال الملاحظة بنجاح',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      } else {
          Get.snackbar(
        '',
        'لم يتم ارسال الشكوى  ',
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
