class UserModel {
  final String? id;
  final String? username;
  final String? email;
  final String? fullName;
  final String? phone;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final DateTime? birthDate;
  final String? gender;
  final String? profileImage;
  final bool isActive;
  final bool isVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? lastLoginAt;
  final List<String> roles;
  final Map<String, dynamic>? preferences;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.fullName,
    this.phone,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.birthDate,
    this.gender,
    this.profileImage,
    this.isActive = true,
    this.isVerified = false,
    this.createdAt,
    this.updatedAt,
    this.lastLoginAt,
    this.roles = const [],
    this.preferences,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      fullName: json['full_name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      zipCode: json['zip_code'] as String?,
      birthDate: json['birth_date'] != null 
          ? DateTime.parse(json['birth_date'] as String) 
          : null,
      gender: json['gender'] as String?,
      profileImage: json['profile_image'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      isVerified: json['is_verified'] as bool? ?? false,
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at'] as String) 
          : null,
      updatedAt: json['updated_at'] != null 
          ? DateTime.parse(json['updated_at'] as String) 
          : null,
      lastLoginAt: json['last_login_at'] != null 
          ? DateTime.parse(json['last_login_at'] as String) 
          : null,
      roles: (json['roles'] as List<dynamic>?)?.cast<String>() ?? [],
      preferences: json['preferences'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'full_name': fullName,
      'phone': phone,
      'address': address,
      'city': city,
      'country': country,
      'zip_code': zipCode,
      'birth_date': birthDate?.toIso8601String(),
      'gender': gender,
      'profile_image': profileImage,
      'is_active': isActive,
      'is_verified': isVerified,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'last_login_at': lastLoginAt?.toIso8601String(),
      'roles': roles,
      'preferences': preferences,
    };
  }

  UserModel copyWith({
    String? id,
    String? username,
    String? email,
    String? fullName,
    String? phone,
    String? address,
    String? city,
    String? country,
    String? zipCode,
    DateTime? birthDate,
    String? gender,
    String? profileImage,
    bool? isActive,
    bool? isVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastLoginAt,
    List<String>? roles,
    Map<String, dynamic>? preferences,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      zipCode: zipCode ?? this.zipCode,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      profileImage: profileImage ?? this.profileImage,
      isActive: isActive ?? this.isActive,
      isVerified: isVerified ?? this.isVerified,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      roles: roles ?? this.roles,
      preferences: preferences ?? this.preferences,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, email: $email, fullName: $fullName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel &&
        other.id == id &&
        other.username == username &&
        other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^ username.hashCode ^ email.hashCode;
  }

  // Helper methods
  bool get hasProfileImage => profileImage != null && profileImage!.isNotEmpty;
  
  bool get isAdmin => roles.contains('admin');
  
  bool get isModerator => roles.contains('moderator') || isAdmin;
  
  String get displayName => fullName ?? username ?? email ?? 'Unknown User';
  
  String get initials {
    if (fullName != null && fullName!.isNotEmpty) {
      final names = fullName!.split(' ');
      if (names.length >= 2) {
        return '${names[0][0]}${names[1][0]}'.toUpperCase();
      } else if (names.length == 1) {
        return names[0][0].toUpperCase();
      }
    }
    if (username != null && username!.isNotEmpty) {
      return username![0].toUpperCase();
    }
    return 'U';
  }
  
  int get age {
    if (birthDate != null) {
      final now = DateTime.now();
      int age = now.year - birthDate!.year;
      if (now.month < birthDate!.month || 
          (now.month == birthDate!.month && now.day < birthDate!.day)) {
        age--;
      }
      return age;
    }
    return 0;
  }
  
  bool get isAdult => age >= 18;
  
  String get formattedBirthDate {
    if (birthDate != null) {
      return '${birthDate!.day}/${birthDate!.month}/${birthDate!.year}';
    }
    return 'Not specified';
  }
  
  String get formattedCreatedDate {
    if (createdAt != null) {
      return '${createdAt!.day}/${createdAt!.month}/${createdAt!.year}';
    }
    return 'Unknown';
  }
  
  String get formattedLastLogin {
    if (lastLoginAt != null) {
      final now = DateTime.now();
      final difference = now.difference(lastLoginAt!);
      
      if (difference.inDays > 0) {
        return '${difference.inDays} days ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} hours ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} minutes ago';
      } else {
        return 'Just now';
      }
    }
    return 'Never';
  }
}
