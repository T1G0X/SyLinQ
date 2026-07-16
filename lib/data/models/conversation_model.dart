class Conversation {
  final String id;
  final List<String> participantIds;
  final String? lastMessageId;
  final DateTime? lastMessageAt;
  final bool isGroup;
  final String? groupName;
  final String? groupAvatarUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  Conversation({
    required this.id,
    required this.participantIds,
    this.lastMessageId,
    this.lastMessageAt,
    this.isGroup = false,
    this.groupName,
    this.groupAvatarUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      id: json['id'] as String,
      participantIds: (json['participant_ids'] as List?)
          ?.map((e) => e as String)
          .toList() ??
          [],
      lastMessageId: json['last_message_id'] as String?,
      lastMessageAt: json['last_message_at'] != null
          ? DateTime.parse(json['last_message_at'] as String)
          : null,
      isGroup: json['is_group'] as bool? ?? false,
      groupName: json['group_name'] as String?,
      groupAvatarUrl: json['group_avatar_url'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'participant_ids': participantIds,
      'last_message_id': lastMessageId,
      'last_message_at': lastMessageAt?.toIso8601String(),
      'is_group': isGroup,
      'group_name': groupName,
      'group_avatar_url': groupAvatarUrl,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
