import 'dart:convert';

class ChatParts {
  final String text;
  ChatParts({
    required this.text,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'text': text});

    return result;
  }

  factory ChatParts.fromMap(Map<String, dynamic> map) {
    return ChatParts(
      text: map['text'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatParts.fromJson(String source) =>
      ChatParts.fromMap(json.decode(source));
}
