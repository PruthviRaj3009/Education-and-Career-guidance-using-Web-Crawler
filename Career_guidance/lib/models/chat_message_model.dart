/// Model for chat messages
/// 
/// Represents a single message in the conversation
class ChatMessageModel {
  final String id;
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final MessageStatus status;

  ChatMessageModel({
    required this.id,
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.status = MessageStatus.sent,
  });

  /// Create a copy with updated fields
  ChatMessageModel copyWith({
    String? id,
    String? text,
    bool? isUser,
    DateTime? timestamp,
    MessageStatus? status,
  }) {
    return ChatMessageModel(
      id: id ?? this.id,
      text: text ?? this.text,
      isUser: isUser ?? this.isUser,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
    );
  }

  /// Convert to Map for storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'isUser': isUser,
      'timestamp': timestamp.toIso8601String(),
      'status': status.toString(),
    };
  }

  /// Create from Map
  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'] as String,
      text: json['text'] as String,
      isUser: json['isUser'] as bool,
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: MessageStatus.values.firstWhere(
        (e) => e.toString() == json['status'],
        orElse: () => MessageStatus.sent,
      ),
    );
  }

  /// Convert to conversation history format for API
  Map<String, String> toConversationFormat() {
    return {
      'role': isUser ? 'user' : 'assistant',
      'content': text,
    };
  }
}

/// Message status enum
enum MessageStatus {
  sending,
  sent,
  error,
}
