import 'package:chat_bot/domain/entities/chat.dart';

abstract class ChatRepository {
  Future<String> generateChat(List<ChatModle> preChat);
}
