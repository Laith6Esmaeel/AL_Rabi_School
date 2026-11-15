import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shcool/Controllers/Login-controller.dart';
import 'package:shcool/models/DaySchedule.dart';
import 'package:shcool/models/Exam_model.dart';
import 'package:shcool/models/TeacherSchedule.dart';

class GetSchedule {
  
  Future<List<ExamSchedule>> getExamSchedule() async {
    String? token = await LoginController.getToken();
    int? userId = await LoginController.getUserId();
    print('$userId');

    final response = await http.get(
      Uri.parse('http://10.156.137.170:8000/api/student/exam-schedule'),
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
      List<ExamSchedule> exams =
          jsonData.map((item) => ExamSchedule.fromJson(item)).toList();
      return exams;
    } else {
      throw Exception('Failed to fetch exam schedule');
    }
  }

  Future<List<DaySchedule>> getWeeklySchedule() async {
    String? token = await LoginController.getToken();
    int? userId = await LoginController.getUserId();
    print('User ID: $userId');

    final response = await http.get(
      Uri.parse('http://10.156.137.170:8000/api/student/schedule'),
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print(' Token: $token');
    print(' Status code: ${response.statusCode}');
    print(' Body: ${response.body}');
    print('--------------------------------------');

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<DaySchedule> schedule =
          jsonData.map((item) => DaySchedule.fromJson(item)).toList();
      return schedule;
    } else {
      throw Exception('Failed to fetch exam schedule');
    }
  }

  Future<List<TimetableTeacherDay>> getWeeklyTeacherSchedule() async {
    String? token = await LoginController.getToken();
    int? userId = await LoginController.getUserId();
    print('User ID: $userId');

    final response = await http.get(
      Uri.parse('http://10.156.137.170:8000/api/teacher/schedule'),
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print(' Token: $token');
    print(' Status code: ${response.statusCode}');
    print(' Body: ${response.body}');
    print('--------------------------------------');

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<TimetableTeacherDay> schedule =
          jsonData.map((item) => TimetableTeacherDay.fromJson(item)).toList();
      return schedule;
    } else {
      throw Exception('Failed to fetch exam schedule');
    }
  }
}
