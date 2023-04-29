class UserModel {
  final String id;
  final String name;
  final String email;
  final String? phoneNumber;
  final String photo;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phoneNumber,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'photo': photo,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'],
      photo: map['photo'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(
          map['createdAt'].millisecondsSinceEpoch),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(
          map['updatedAt'].millisecondsSinceEpoch),
    );
  }
}
