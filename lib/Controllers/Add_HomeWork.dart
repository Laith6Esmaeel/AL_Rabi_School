
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Controllers/Login-controller.dart';
import 'package:http_parser/http_parser.dart';

class AddHomework extends GetxController {
  static TextEditingController sectionController = TextEditingController();
  static TextEditingController gradeController = TextEditingController();
  static RxString filePath = ''.obs;
  static RxBool isLoading = false.obs;

  static Future<void> addHomework() async {
    if (sectionController.text.isEmpty ||
        gradeController.text.isEmpty ||
        filePath.value.isEmpty) {
      Get.snackbar(
        'خطأ',
        'يرجى ملء جميع الحقول واختيار صورة',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      String? token = await LoginController.getToken();

      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var url = Uri.parse("http://10.156.137.170:8000/api/homeworks");

      var request = http.MultipartRequest('POST', url);
      request.headers.addAll(headers);

      request.fields['section_id'] = sectionController.text;
      request.fields['grade_id'] = gradeController.text;

      // ملف الصورة
      File file = File(filePath.value);
      String fileName = filePath.value.split("/").last;

      var multipartFile = http.MultipartFile(
        'file_path', // تأكد من اسم الحقل مطابق للـ backend
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: fileName,
        contentType: MediaType('image', 'jpg'), // أو 'png' حسب نوع الصورة
      );

      request.files.add(multipartFile);

      var response = await request.send();
      var responseData = await response.stream.bytesToString();

      print('Status: ${response.statusCode}');
      print('Body: $responseData');

      var jsonResponse = jsonDecode(responseData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          'نجاح',
          'تم رفع الواجب بنجاح',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        sectionController.clear();
        gradeController.clear();
        filePath.value = '';
      } else {
        throw jsonResponse['message'] ?? 'حدث خطأ غير معروف';
      }
    } catch (e) {
      Get.snackbar(
        'خطأ',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
