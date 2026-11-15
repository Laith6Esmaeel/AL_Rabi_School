class Complaint {
  final int id;
  final int userId;
  final String complaint;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Complaint({
    required this.id,
    required this.userId,
    required this.complaint,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      complaint: json['complaint'] ?? '',
      status: json['status'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'complaint': complaint,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
