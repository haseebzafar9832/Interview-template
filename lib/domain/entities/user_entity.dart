/// User entity for the domain layer
abstract class UserEntity {
  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatar,
    required this.dateOfBirth,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  /// User unique identifier
  final String id;
  
  /// User full name
  final String name;
  
  /// User email address
  final String email;
  
  /// User phone number
  final String phone;
  
  /// User avatar image URL
  final String avatar;
  
  /// User date of birth
  final DateTime? dateOfBirth;
  
  /// Whether the user account is active
  final bool isActive;
  
  /// When the user account was created
  final DateTime? createdAt;
  
  /// When the user account was last updated
  final DateTime? updatedAt;

  /// Get user's age
  int? get age {
    if (dateOfBirth == null) return null;
    final now = DateTime.now();
    int age = now.year - dateOfBirth!.year;
    if (now.month < dateOfBirth!.month || 
        (now.month == dateOfBirth!.month && now.day < dateOfBirth!.day)) {
      age--;
    }
    return age;
  }

  /// Get user's initials
  String get initials {
    final nameParts = name.split(' ');
    if (nameParts.isEmpty) return '';
    if (nameParts.length == 1) return nameParts[0][0].toUpperCase();
    return '${nameParts[0][0]}${nameParts[nameParts.length - 1][0]}'.toUpperCase();
  }

  /// Check if user has avatar
  bool get hasAvatar => avatar.isNotEmpty;

  /// Check if user is verified (has email)
  bool get isVerified => email.isNotEmpty;

  /// Get display name (first name only)
  String get displayName {
    final nameParts = name.split(' ');
    return nameParts.isNotEmpty ? nameParts[0] : name;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserEntity &&
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
    return 'UserEntity(id: $id, name: $name, email: $email, phone: $phone, avatar: $avatar, dateOfBirth: $dateOfBirth, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
