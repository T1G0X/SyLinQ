class Community {
  final String id;
  final String name;
  final String? description;
  final String? avatarUrl;
  final String? coverPhotoUrl;
  final String creatorId;
  final int membersCount;
  final int postsCount;
  final bool isJoined;
  final List<String>? rules;
  final DateTime createdAt;
  final DateTime updatedAt;

  Community({
    required this.id,
    required this.name,
    this.description,
    this.avatarUrl,
    this.coverPhotoUrl,
    required this.creatorId,
    this.membersCount = 0,
    this.postsCount = 0,
    this.isJoined = false,
    this.rules,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Community.fromJson(Map<String, dynamic> json) {
    return Community(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      coverPhotoUrl: json['cover_photo_url'] as String?,
      creatorId: json['creator_id'] as String,
      membersCount: json['members_count'] as int? ?? 0,
      postsCount: json['posts_count'] as int? ?? 0,
      isJoined: json['is_joined'] as bool? ?? false,
      rules: (json['rules'] as List?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'avatar_url': avatarUrl,
      'cover_photo_url': coverPhotoUrl,
      'creator_id': creatorId,
      'members_count': membersCount,
      'posts_count': postsCount,
      'is_joined': isJoined,
      'rules': rules,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
