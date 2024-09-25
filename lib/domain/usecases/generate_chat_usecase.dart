import 'package:chat_bot/domain/entities/chat.dart';
import 'package:chat_bot/domain/repository/chat_repository.dart';

class GenerateChatUsecase {
  final ChatRepository repository;

  GenerateChatUsecase(this.repository);

  Future<String> execute(List<ChatModle> preChat) async {
    return await repository.generateChat(preChat);
  }
}
