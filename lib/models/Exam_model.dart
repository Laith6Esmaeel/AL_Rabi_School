
class ExamSchedule {
  final String day;
  final String examDate;
  final List<Exam> exams;

  ExamSchedule({
    required this.day,
    required this.examDate,
    required this.exams,
  });

  factory ExamSchedule.fromJson(Map<String, dynamic> json) {
    var examsJson = json['exams'] as List<dynamic>;
    List<Exam> examsList = examsJson.map((e) => Exam.fromJson(e)).toList();

    return ExamSchedule(
      day: json['day'] as String,
      examDate: json['exam_date'] as String,
      exams: examsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'exam_date': examDate,
      'exams': exams.map((e) => e.toJson()).toList(),
    };
  }  
}
class Exam {
    final String subjectName;
    final String examTime;

    Exam({
      required this.subjectName,
      required this.examTime,
    });

    factory Exam.fromJson(Map<String, dynamic> json) {
      return Exam(
        subjectName: json['subject_name'] as String,
        examTime: json['exam_time'] as String,
      );
    }

    Map<String, dynamic> toJson() {
      return {
        'subject_name': subjectName,
        'exam_time': examTime,
      };
    }
  }
