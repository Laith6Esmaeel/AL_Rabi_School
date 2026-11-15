import 'dart:convert';

class SearchStudent {
  final int id;
  final String studentName;
  final String email;
  final String phoneNumber;
  final String? gender;
  final String grade;
  final String section;

  SearchStudent({
    required this.id,
    required this.studentName,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.grade,
    required this.section,
  });

  /// fromJson
  factory SearchStudent.fromJson(Map<String, dynamic> json) {
    return SearchStudent(
      id: json['id'] as int,
      studentName: json['student_name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      gender: json['gender'] as String?, 
      grade: json['grade'] as String,
      section: json['section'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'student_name': studentName,
      'email': email,
      'phone_number': phoneNumber,
      'gender': gender,
      'grade': grade,
      'section': section,
    };
  }
}

List<SearchStudent> studentsFromJson(String str) =>
    List<SearchStudent>.from(json.decode(str).map((x) => SearchStudent.fromJson(x)));

String studentsToJson(List<SearchStudent> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
