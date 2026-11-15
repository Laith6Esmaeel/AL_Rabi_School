class StudentAbsence {
  final String date;
  final String excuse;

  final String studentName;

  StudentAbsence({
    required this.date,
    required this.excuse,
    required this.studentName,
  });

  factory StudentAbsence.fromJson(Map<String, dynamic> json) {
    return StudentAbsence(
      date: json['date'] ?? '',
      excuse: json['excuse'] ?? '',
      studentName: json['student_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'excuse': excuse,
      'student_name': studentName,
    };
  }
}
