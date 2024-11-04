class UserModel {
  String? name;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;

  UserModel({this.name, this.email, this.updatedAt, this.createdAt, this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      createdAt: json['created_at'] ?? '',
      id: json['id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}