import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shcool/Controllers/Login-controller.dart';
import 'package:shcool/models/Complaint%20_model.dart';

class GetComplaints {
  Future<List<Complaint>> getComplaints() async {
    String? token = await LoginController.getToken();
    int? userId = await LoginController.getUserId();
    print('User ID: $userId');

    final response = await http.get(
      Uri.parse(
          'http://10.156.137.170:8000/api/complaints/my'), 
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print('Token: $token');
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    print('--------------------------------------------');

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<Complaint> complaints =
          jsonData.map((item) => Complaint.fromJson(item)).toList();
      return complaints;
    } else {
      throw Exception('Failed to fetch complaints');
    }
  }
}
