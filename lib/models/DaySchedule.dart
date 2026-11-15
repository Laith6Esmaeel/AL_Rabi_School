class DaySchedule {
  final String day;
  final List<Lesson> lessons;

  DaySchedule({
    required this.day,
    required this.lessons,
  });

  factory DaySchedule.fromJson(Map<String, dynamic> json) {
    var lessonsJson = json['lessons'] as List<dynamic>;
    List<Lesson> lessonList =
        lessonsJson.map((e) => Lesson.fromJson(e)).toList();

    return DaySchedule(
      day: json['day'] as String,
      lessons: lessonList,
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
  final String teacher;
  final String startTime;
  final String endTime;

  Lesson({
    required this.subject,
    required this.teacher,
    required this.startTime,
    required this.endTime,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      subject: json['subject'] as String,
      teacher: json['teacher'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'teacher': teacher,
      'start_time': startTime,
      'end_time': endTime,
    };
  }
}
