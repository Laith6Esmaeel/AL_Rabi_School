class StudentEvaluation {
  final String studentName;
  final String teacherName;
  final String grade;
  final String section;
  final int level;
  final int interaction;
  final int behavior;
  final int semester1;
  final int semester2;
  final String description;

  StudentEvaluation({
    required this.studentName,
    required this.teacherName,
    required this.grade,
    required this.section,
    required this.level,
    required this.interaction,
    required this.behavior,
    required this.semester1,
    required this.semester2,
    required this.description,
  });

  // Factory لتحويل JSON إلى Object
  factory StudentEvaluation.fromJson(Map<String, dynamic> json) {
    return StudentEvaluation(
      studentName: json['student_name'] ?? '',
      teacherName: json['teacher_name'] ?? '',
      grade: json['grade'] ?? '',
      section: json['section'] ?? '',
      level: json['level'] ?? 0,
      interaction: json['interaction'] ?? 0,
      behavior: json['behavior'] ?? 0,
      semester1: json['semester1'] ?? 0,
      semester2: json['semester2'] ?? 0,
      description: json['description'] ?? '',
    );
  }

  // لتحويل Object إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'student_name': studentName,
      'teacher_name': teacherName,
      'grade': grade,
      'section': section,
      'level': level,
      'interaction': interaction,
      'behavior': behavior,
      'semester1': semester1,
      'semester2': semester2,
      'description': description,
    };
  }

  // لتحويل List JSON إلى List Object
  static List<StudentEvaluation> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((e) => StudentEvaluation.fromJson(e)).toList();
  }
}
