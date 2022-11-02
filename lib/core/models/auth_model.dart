import 'dart:convert';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));

class AuthResponse {
  AuthResponse({
    this.message,
    this.user,
  });

  String? message;
  User? user;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    message: json["message"],
    user: User.fromJson(json["data"]),
  );
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.isAvailable,
    this.isActive,
    this.phone,
    this.agencyId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.accessToken,
  });

  int? id;
  String? name;
  String? email;
  String? password;
  int? isAvailable;
  int? isActive;
  String? phone;
  int? agencyId;
  dynamic deletedAt;
  dynamic createdAt;
  dynamic updatedAt;
  String? accessToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    isAvailable: json["is_available"],
    isActive: json["is_active"],
    phone: json["phone"],
    agencyId: json["agency_id"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
    "is_available": isAvailable,
    "is_active": isActive,
    "phone": phone,
    "agency_id": agencyId,
    "deleted_at": deletedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "access_token": accessToken,
  };

}
