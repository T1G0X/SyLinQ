class Message {
  final String id;
  final String conversationId;
  final String senderId;
  final String? content;
  final String? mediaUrl;
  final String messageType; // text, image, video, voice, file
  final bool isRead;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Message({
    required this.id,
    required this.conversationId,
    required this.senderId,
    this.content,
    this.mediaUrl,
    this.messageType = 'text',
    this.isRead = false,
    required this.createdAt,
    this.updatedAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] as String,
      conversationId: json['conversation_id'] as String,
      senderId: json['sender_id'] as String,
      content: json['content'] as String?,
      mediaUrl: json['media_url'] as String?,
      messageType: json['message_type'] as String? ?? 'text',
      isRead: json['is_read'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'conversation_id': conversationId,
      'sender_id': senderId,
      'content': content,
      'media_url': mediaUrl,
      'message_type': messageType,
      'is_read': isRead,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
