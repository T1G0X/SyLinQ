// Data Models

class User {
  final String id;
  final String email;
  final String? username;
  final String? displayName;
  final String? avatarUrl;
  final String? coverPhotoUrl;
  final String? bio;
  final String? website;
  final String? location;
  final DateTime? birthDate;
  final int followersCount;
  final int followingCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isVerified;

  User({
    required this.id,
    required this.email,
    this.username,
    this.displayName,
    this.avatarUrl,
    this.coverPhotoUrl,
    this.bio,
    this.website,
    this.location,
    this.birthDate,
    this.followersCount = 0,
    this.followingCount = 0,
    required this.createdAt,
    required this.updatedAt,
    this.isVerified = false,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String?,
      displayName: json['display_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      coverPhotoUrl: json['cover_photo_url'] as String?,
      bio: json['bio'] as String?,
      website: json['website'] as String?,
      location: json['location'] as String?,
      birthDate: json['birth_date'] != null
          ? DateTime.parse(json['birth_date'] as String)
          : null,
      followersCount: json['followers_count'] as int? ?? 0,
      followingCount: json['following_count'] as int? ?? 0,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      isVerified: json['is_verified'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'display_name': displayName,
      'avatar_url': avatarUrl,
      'cover_photo_url': coverPhotoUrl,
      'bio': bio,
      'website': website,
      'location': location,
      'birth_date': birthDate?.toIso8601String(),
      'followers_count': followersCount,
      'following_count': followingCount,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'is_verified': isVerified,
    };
  }

  User copyWith({
    String? id,
    String? email,
    String? username,
    String? displayName,
    String? avatarUrl,
    String? coverPhotoUrl,
    String? bio,
    String? website,
    String? location,
    DateTime? birthDate,
    int? followersCount,
    int? followingCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isVerified,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      coverPhotoUrl: coverPhotoUrl ?? this.coverPhotoUrl,
      bio: bio ?? this.bio,
      website: website ?? this.website,
      location: location ?? this.location,
      birthDate: birthDate ?? this.birthDate,
      followersCount: followersCount ?? this.followersCount,
      followingCount: followingCount ?? this.followingCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}
