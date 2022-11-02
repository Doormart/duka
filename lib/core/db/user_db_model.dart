const String tableName = 'user_db';

class UserField {
  static String id = 'id';
  static String name = 'name';
  static String email = 'email';
  static String isAvailable = 'is_available';
  static String isActive = 'is_active';
  static String phone = 'phone';
  static String agencyId = 'agency_id';
}

class UserDbModel {
  UserDbModel({
    this.id,
    this.name,
    this.email,
    this.isAvailable,
    this.isActive,
    this.phone,
    this.agencyId,
  });

  final int? id;
  final String? name;
  final String? email;
  final bool? isAvailable;
  final bool? isActive;
  final String? phone;
  final int? agencyId;

  UserDbModel copy({
    int? id,
    String? name,
    String? email,
    bool? isAvailable,
    bool? isActive,
    String? phone,
    int? agencyId,
  }) {
    return UserDbModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      isAvailable: isAvailable ?? this.isAvailable,
      isActive: isActive ?? this.isActive,
      phone: phone ?? this.phone,
      agencyId: agencyId ?? this.agencyId,
    );
  }

  factory UserDbModel.fromJson(Map<String, dynamic> json) {
    return UserDbModel(
        id: json[UserField.id] as int,
        name: json[UserField.name] as String,
        email: json[UserField.email] as String,
        isAvailable: json[UserField.isAvailable] as int == 1,
        isActive: json[UserField.isActive] as int == 1,
        phone: json[UserField.phone] as String,
        agencyId: json[UserField.agencyId] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      UserField.id: id,
      UserField.phone: phone,
      UserField.isActive: isActive! ? 1:0,
      UserField.isAvailable: isAvailable! ? 1:0,
      UserField.name: name,
      UserField.email: email,
      UserField.agencyId: agencyId,
    };
  }
}
