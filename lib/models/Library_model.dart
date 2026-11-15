class HomeworkFile {
  final int id;
  final String fileUrl;

  HomeworkFile({
    required this.id,
    required this.fileUrl,
  });

  factory HomeworkFile.fromJson(Map<String, dynamic> json) {
    return HomeworkFile(
      id: json['id'] as int,
      fileUrl: json['file_url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'file_url': fileUrl,
    };
  }
}