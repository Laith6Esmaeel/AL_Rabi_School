class TimetableTeacherDay {
  final String day;
  final List<Lesson> lessons;

  TimetableTeacherDay({required this.day, required this.lessons});

  factory TimetableTeacherDay.fromJson(Map<String, dynamic> json) {
    return TimetableTeacherDay(
      day: json['day'] ?? '',
      lessons:
          (json['lessons'] as List).map((e) => Lesson.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'lessons': lessons.map((e) => e.toJson()).toList(),
    };
  }
}

class Lesson {
  final String subject;
  final String? grade;
  final String? section;
  final String? startTime;
  final String? endTime;

  Lesson({
    required this.subject,
    this.grade,
    this.section,
    this.startTime,
    this.endTime,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      subject: json['subject'] ?? '',
      grade: json['grade'],
      section: json['section'],
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'grade': grade,
      'section': section,
      'start_time': startTime,
      'end_time': endTime,
    };
  }
}
