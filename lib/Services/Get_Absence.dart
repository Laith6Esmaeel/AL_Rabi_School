import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shcool/Controllers/Login-controller.dart';
import 'package:shcool/models/StudentAbsence%20_model.dart';

class GetAbsence {
  Future<List<StudentAbsence>> getAbsences() async {
    String? token = await LoginController.getToken();
    int? userId = await LoginController.getUserId();
    print('User ID: $userId');

    final response = await http.get(
      Uri.parse('http://10.156.137.170:8000/api/student/absences'),
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
      List<StudentAbsence> absences =
          jsonData.map((item) => StudentAbsence.fromJson(item)).toList();
      return absences;
    } else {
      throw Exception('Failed to fetch absences');
    }
  }
}
