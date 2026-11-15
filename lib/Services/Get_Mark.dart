import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:shcool/Controllers/Login-controller.dart';
import 'package:shcool/models/StudentsMark_model.dart';

class GetMark {
  Future<List<StudenttMarks>> getMarks() async {
    String? token = await LoginController.getToken();
    int? userId = await LoginController.getUserId();
    print('UserId: $userId');

    final response = await http.get(
      Uri.parse('http://10.156.137.170:8000/api/student/marks'),
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print('Token: $token');
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    print('--------------------------------------');

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);

      List<StudenttMarks> marksList =
          jsonData.map((item) => StudenttMarks.fromJson(item)).toList();

      return marksList;
    } else {
      throw Exception('Failed to fetch student marks');
    }
  }
}
