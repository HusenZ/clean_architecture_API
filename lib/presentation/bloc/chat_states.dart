import 'package:chat_bot/domain/entities/chat.dart';

abstract class ChatStates {}

class ChatInitialState extends ChatStates {}

class GnerateChatSuccessState extends ChatStates {
  final List<ChatModle> chats;

  GnerateChatSuccessState({required this.chats});
}

class GnerateChatFailureState extends ChatStates {
  final String eMessage;

  GnerateChatFailureState({required this.eMessage});
}
