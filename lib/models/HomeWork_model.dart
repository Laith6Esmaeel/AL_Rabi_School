class GalleryModel {
  final int id;
  final int gradeId;
  final int sectionId;
  final String filePath;
  final DateTime createdAt;
  final DateTime updatedAt;

  GalleryModel({
    required this.id,
    required this.gradeId,
    required this.sectionId,
    required this.filePath,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    return GalleryModel(
      id: json['id'] as int,
      gradeId: json['grade_id'] as int,
      sectionId: json['section_id'] as int,
      filePath: json['file_path'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'grade_id': gradeId,
      'section_id': sectionId,
      'file_path': filePath,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}