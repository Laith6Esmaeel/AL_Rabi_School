import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shcool/Controllers/Login-controller.dart';
import 'package:shcool/models/Sesrch_model.dart';

class SearchStudentController extends GetxController {
  static TextEditingController nameController = TextEditingController();

  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<List<SearchStudent>> searchStudent() async {
    String? token = await LoginController.getToken();
    try {
      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var url =
          Uri.parse("http://10.156.137.170:8000/api/teacher/students/search");

      Map body = {
        'name': nameController.text,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        Get.snackbar(
          '',
          'تم البحث بنجاح',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        List<SearchStudent> students = studentsFromJson(response.body);

        return students;
      } else {
        throw jsonDecode(response.body)['message'] ?? 'Unknown Error Occurred';
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
        },
      );
      return [];
    }
  }
}
