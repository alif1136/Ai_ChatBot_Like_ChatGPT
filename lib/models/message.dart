enum MessageRole { user, assistant, system }

class Message {
  final MessageRole role;
  final String text;
  final DateTime timestamp;

  Message({
    required this.role,
    required this.text,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, String> toApiJson() {
    return {
      'role': role.name,
      'content': text,
    };
  }

  Message copyWith({String? text}) {
    return Message(
      role: role,
      text: text ?? this.text,
      timestamp: timestamp,
    );
  }
}
