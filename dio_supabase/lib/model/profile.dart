// lib/model/profile.dart

class MyProfile {
  int id;
  String name;
  String imageUrl;
  DateTime birthday;

  MyProfile({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.birthday,
  });

  factory MyProfile.fromJson(Map<String, dynamic> json) {
    return MyProfile(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String,
      birthday: DateTime.parse(json['birthday'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image_url': imageUrl,
        'birthday': birthday.toIso8601String(),
      };
}
