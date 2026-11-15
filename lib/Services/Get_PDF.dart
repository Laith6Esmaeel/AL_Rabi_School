import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shcool/Controllers/Login-controller.dart';
import 'package:shcool/models/Library_model.dart';

class GetPdf {
  Future<List<HomeworkFile>> getPDF() async {
    String? token = await LoginController.getToken();
    int? userId = await LoginController.getUserId();

    http.Response response = await http.get(
      Uri.parse('http://10.156.137.170:8000/api/resources'),
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print('PDF Response Status: ${response.statusCode}');
    print('PDF Response Body: ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      
      List<HomeworkFile> pdfList = jsonList
          .map((jsonItem) {
            // استخدام file_url بدلاً من file_path
            String fixedUrl = (jsonItem['file_url'] as String).replaceAll(
              'http://127.0.0.1:8000',
              'http://10.156.137.170:8000'
            );
            
            return HomeworkFile.fromJson({
              ...jsonItem,
              'file_url': fixedUrl, // التأكد من أن المفتاح هو file_url
            });
          })
          .toList();
      
      print('Number of PDF files: ${pdfList.length}');
      return pdfList;
    } else {
      throw Exception('Failed to fetch PDF files: ${response.statusCode}');
    }
  }
}