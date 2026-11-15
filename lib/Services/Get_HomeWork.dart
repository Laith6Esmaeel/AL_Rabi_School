
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shcool/Controllers/Login-controller.dart';
import 'package:shcool/models/HomeWork_model.dart';

class GetHomework {
  Future<List<GalleryModel>> getHomework() async {
    String? token = await LoginController.getToken();
    int? userId = await LoginController.getUserId();

    http.Response response = await http.get(
      Uri.parse('http://10.156.137.170:8000/api/my-homeworks'),
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      
      List<GalleryModel> homeworkList = jsonList
          .map((jsonItem) {
            // تصحيح الروابط قبل إنشاء الـ Model
            String fixedUrl = (jsonItem['file_path'] as String).replaceAll(
              'http://127.0.0.1:8000',
              'http://10.156.137.170:8000'
            );
            
            return GalleryModel.fromJson({
              ...jsonItem,
              'file_path': fixedUrl,
            });
          })
          .toList();
      
      return homeworkList;
    } else {
      throw Exception('Failed to fetch homework: ${response.statusCode}');
    }
  }
}