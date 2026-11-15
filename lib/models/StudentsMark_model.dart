class StudenttMarks {
  final String student;
  final List<Mark> marks;
  final double averageScore;

  StudenttMarks({
    required this.student,
    required this.marks,
    required this.averageScore,
  });

  factory StudenttMarks.fromJson(Map<String, dynamic> json) {
    return StudenttMarks(
      student: json['student'] ?? '',
      marks: (json['marks'] as List<dynamic>)
          .map((e) => Mark.fromJson(e))
          .toList(),
      averageScore: (json['average_score'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'student': student,
      'marks': marks.map((e) => e.toJson()).toList(),
      'average_score': averageScore,
    };
  }
}

class Mark {
  final String subjectName;
  final int maxScore;
  final double score;
  final String assessmentType;

  Mark({
    required this.subjectName,
    required this.maxScore,
    required this.score,
    required this.assessmentType,
  });

  factory Mark.fromJson(Map<String, dynamic> json) {
    return Mark(
      subjectName: json['subject_name'] ?? '',
      maxScore: json['max_score'] ?? 0,
      score: double.tryParse(json['score'].toString()) ?? 0.0,
      assessmentType: json['assessment_type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subject_name': subjectName,
      'max_score': maxScore,
      'score': score.toStringAsFixed(2),
      'assessment_type': assessmentType,
    };
  }
}
