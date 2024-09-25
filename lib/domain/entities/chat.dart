import 'dart:convert';

import 'package:chat_bot/domain/entities/chat_part.dart';

class ChatModle {
  final String role;
  final List<ChatParts> parts;

  ChatModle({
    required this.role,
    required this.parts,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'role': role});
    result.addAll({'parts': parts.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ChatModle.fromMap(Map<String, dynamic> map) {
    return ChatModle(
      role: map['role'] ?? '',
      parts:
          List<ChatParts>.from(map['parts']?.map((x) => ChatParts.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModle.fromJson(String source) =>
      ChatModle.fromMap(json.decode(source));
}
