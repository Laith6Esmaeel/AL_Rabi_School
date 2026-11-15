import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shcool/Controllers/Login-controller.dart';
import 'package:shcool/models/Reports_model.dart';

class GetReports {
  Future<StudentEvaluation> getReport() async {
    final String? token = await LoginController.getToken();
    final int? userId = await LoginController.getUserId();
    print('UserId: $userId');
    print('================== GetReports ==================');

    final response = await http.get(
      Uri.parse('http://10.156.137.170:8000/api/student/my-evaluations'),
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
    print('================================================');

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      if (decoded is List) {
        if (decoded.isEmpty) {
          throw Exception('لا توجد تقارير متاحة');
        }
        final first = decoded.first;
        if (first is Map<String, dynamic>) {
          return StudentEvaluation.fromJson(first);
        } else {
          throw FormatException('شكل العنصر داخل القائمة غير متوقع');
        }
      }

      if (decoded is Map<String, dynamic>) {
        return StudentEvaluation.fromJson(decoded);
      }

      throw FormatException('شكل الاستجابة غير متوقع');
    } else {
      throw Exception('Failed to fetch report: ${response.statusCode}');
    }
  }
}
