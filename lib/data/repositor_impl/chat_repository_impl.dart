import 'package:chat_bot/data/remote_data/remote_data_source.dart';
import 'package:chat_bot/domain/entities/chat.dart';
import 'package:chat_bot/domain/repository/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final RemoteDataSource remoteDataSource;

  ChatRepositoryImpl(this.remoteDataSource);
  @override
  Future<String> generateChat(List<ChatModle> preChat) async {
    try {
      final String result = await remoteDataSource.generateChatMessage(preChat);
      return result;
    } catch (e) {
      return e.toString();
    }
  }
}
