import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shcool/Controllers/Login-controller.dart';
import 'package:shcool/models/profile_model.dart';

class profile {
  Future<ProfileModel> profille() async {
    String? token = await LoginController.getToken();
    int? userId = await LoginController.getUserId();
    print('$userId');
    print('ddddddddddddddddddddddddddddddddddddddddddddddddd');

    http.Response response = await http
        .get(Uri.parse('http://10.156.137.170:8000/api/auth/me'), headers: {
      'accept': 'applicationj/son',
      'Authorization': 'Bearer $token',
    });
    print(token);
    print(response.statusCode);
    print(response.body);
    print(
        '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData =
          Map<String, dynamic>.from(jsonDecode(response.body));
      print(jsonData);
      ProfileModel prfoile = ProfileModel.fromJson(jsonData);

      return prfoile;
    } else {
      throw Exception('Failed to fetch profile');
    }
  }
}
