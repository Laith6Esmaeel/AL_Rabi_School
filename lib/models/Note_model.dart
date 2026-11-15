class StudentNote {
  final int id;
  final String note;
  final String type;
  final String teacherName;
  final String createdAt;

  StudentNote({
    required this.id,
    required this.note,
    required this.type,
    required this.teacherName,
    required this.createdAt,
  });

  factory StudentNote.fromJson(Map<String, dynamic> json) {
    return StudentNote(
      id: json['id'] as int,
      note: json['note'] as String,
      type: json['type'] as String,
      teacherName: json['teacher_name'] as String,
      createdAt: json['created_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'note': note,
      'type': type,
      'teacher_name': teacherName,
      'created_at': createdAt,
    };
  }
}