import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_bot/domain/entities/chat.dart';
import 'package:chat_bot/domain/entities/chat_part.dart';
import 'package:chat_bot/domain/usecases/generate_chat_usecase.dart';
import 'package:chat_bot/presentation/bloc/chat_events.dart';
import 'package:chat_bot/presentation/bloc/chat_states.dart';

class ChatBloc extends Bloc<ChatEvents, ChatStates> {
  final GenerateChatUsecase generateChatUsecase;

  ChatBloc(this.generateChatUsecase) : super(ChatInitialState()) {
    on<GenerateChatEvent>(generateChat);
  }

  List<ChatModle> messages = [];

  FutureOr<void> generateChat(
      GenerateChatEvent event, Emitter<ChatStates> emit) async {
    messages.add(
      ChatModle(
        role: 'user',
        parts: [ChatParts(text: event.userMesg)],
      ),
    );
    emit(GnerateChatSuccessState(chats: messages));
    String answer = await generateChatUsecase.execute(messages);

    messages.add(
      ChatModle(
        role: 'model',
        parts: [ChatParts(text: answer)],
      ),
    );
    emit(GnerateChatSuccessState(chats: messages));

    //TODO:Handle the error state...--> HM
  }
}
