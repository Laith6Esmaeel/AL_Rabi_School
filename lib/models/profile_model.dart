class ProfileModel {
  String? name;
  String? email;
  String? gender;
  String? image;
  String? phoneNumber;

  String? role;

  ProfileModel({
    this.name,
    this.email,
    this.gender,
    this.phoneNumber,
    this.image,
    this.role,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> data) {
    return ProfileModel(
      name: data['name'],
      phoneNumber: data['phone_number'],
      email: data['email'],
      gender: data['gender'],
      image: data['image'],
      role: data['role'],
    );
  }

  @override
  String toString() {
    return 'name=$name';
  }
}
