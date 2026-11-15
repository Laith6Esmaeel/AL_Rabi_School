class Students {
  final int id;
  final String studentName;
  final String email;
  final String phoneNumber;
  final String? gender;
  final double averageScore;
  final String grade;
  final String? image;
  final String section;

  Students({
    required this.id,
    required this.studentName,
    required this.email,
    required this.phoneNumber,
    this.gender,
    required this.averageScore,
    required this.grade,
    required this.image,
    required this.section,
  });

  factory Students.fromJson(Map<String, dynamic> json) {
    return Students(
      id: json['id'] ?? 0,
      studentName: json['student_name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      gender: json['gender'],
      averageScore: (json['average_score'] is int)
          ? (json['average_score'] as int).toDouble()
          : (json['average_score'] ?? 0.0).toDouble(),
      grade: json['grade'] ?? '',
      image: json['image'],
      section: json['section'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'student_name': studentName,
      'email': email,
      'phone_number': phoneNumber,
      'gender': gender,
      'average_score': averageScore,
      'grade': grade,
      'image': image,
      'section': section,
    };
  }

  static List<Students> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Students.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<Students> students) {
    return students.map((student) => student.toJson()).toList();
  }
}
