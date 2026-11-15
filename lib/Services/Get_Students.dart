import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shcool/Controllers/Login-controller.dart';
import 'package:shcool/models/students_model.dart';

class GetStudents {
  Future<List<Students>> getStudents() async {
    String? token = await LoginController.getToken();
    int? userId = await LoginController.getUserId();
    print('$userId');
    print('ddddddddddddddddddddddddddddddddddddddddddddddddd');

    http.Response response = await http.get(
      Uri.parse('http://10.156.137.170:8000/api/teacher/students'),
      headers: {
        'accept': 'application/json', 
        'Authorization': 'Bearer $token',
      },
    );

    print(token);
    print(response.statusCode);
    print(response.body);
    print(
        '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);

      List<Students> students =
          jsonData.map((e) => Students.fromJson(e)).toList();

      return students;
    } else {
      throw Exception('Failed to fetch students');
    }
  }
}
