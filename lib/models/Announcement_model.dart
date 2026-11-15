class Announcement {
  final int id;
  final String name;
  final String? img;
  final String description;
 
  Announcement({
    required this.id,
    required this.name,
    this.img,
    required this.description,

  });

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      img: json['img'], 
      description: json['description'] ?? '',

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'img': img,
      'description': description,
    };
  }

  static List<Announcement> listFromNestedJson(List<dynamic> json) {
    if (json.isEmpty) return [];
    final innerList = json.first as List<dynamic>;
    return innerList.map((item) => Announcement.fromJson(item)).toList();
  }
}
