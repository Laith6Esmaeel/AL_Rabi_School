import 'dart:convert';

import 'package:shcool/Controllers/Login-controller.dart';
import 'package:shcool/models/Announcement_model.dart';
import 'package:http/http.dart' as http;

class GetAnnouncement {
  Future<List<Announcement>> getAnnouncement() async {
    String? token = await LoginController.getToken();
    int? userId = await LoginController.getUserId();
    print('User ID: $userId');

    final response = await http.get(
      Uri.parse('http://10.156.137.170:8000/api/events'),
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print('Token: $token');
    print('Status *********************: ${response.statusCode}');
    print('Body: ${response.body}');
    print('--------------------------------------');

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);

      if (jsonData.isNotEmpty && jsonData.first is List) {
        List<dynamic> innerList = jsonData.first;
        List<Announcement> announcements =
            innerList.map((item) => Announcement.fromJson(item)).toList();
        return announcements;
      } else {
        throw Exception('Unexpected JSON format');
      }
    } else {
      throw Exception('Failed to fetch announcements');
    }
  }
}
