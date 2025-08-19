import '../../domain/entities/user_entity.dart';

/// User data model
class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.avatar,
    required super.dateOfBirth,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
  });

  /// Create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      dateOfBirth:
          json['dateOfBirth'] != null
              ? DateTime.parse(json['dateOfBirth'] as String)
              : null,
      isActive: json['isActive'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  /// Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'isActive': isActive,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }

  /// Create UserModel from UserEntity
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      phone: entity.phone,
      avatar: entity.avatar,
      dateOfBirth: entity.dateOfBirth,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Create a copy of UserModel with updated fields
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? avatar,
    DateTime? dateOfBirth,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Create empty UserModel
  factory UserModel.empty() {
    return const UserModel(
      id: '',
      name: '',
      email: '',
      phone: '',
      avatar: '',
      dateOfBirth: null,
      isActive: false,
      createdAt: null,
      updatedAt: null,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.avatar == avatar &&
        other.dateOfBirth == dateOfBirth &&
        other.isActive == isActive &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      name,
      email,
      phone,
      avatar,
      dateOfBirth,
      isActive,
      createdAt,
      updatedAt,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, phone: $phone, avatar: $avatar, dateOfBirth: $dateOfBirth, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
