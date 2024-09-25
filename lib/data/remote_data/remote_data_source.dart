import 'package:chat_bot/core/constants/api_const.dart';
import 'package:chat_bot/core/server_exception.dart';
import 'package:chat_bot/domain/entities/chat.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<String> generateChatMessage(List<ChatModle> preChat);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl(this.dio);

  @override
  Future<String> generateChatMessage(List<ChatModle> preChat) async {
    var regBody = {
      "contents": preChat.map((e) => e.toMap()).toList(),
      "generationConfig": {
        "temperature": 0.9,
        "topK": 1,
        "topP": 1,
        "maxOutputTokens": 2048,
        "stopSequences": []
      },
      "safetySettings": [
        {
          "category": "HARM_CATEGORY_HARASSMENT",
          "threshold": "BLOCK_MEDIUM_AND_ABOVE"
        },
        {
          "category": "HARM_CATEGORY_HATE_SPEECH",
          "threshold": "BLOCK_MEDIUM_AND_ABOVE"
        },
        {
          "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
          "threshold": "BLOCK_MEDIUM_AND_ABOVE"
        },
        {
          "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
          "threshold": "BLOCK_MEDIUM_AND_ABOVE"
        }
      ]
    };

    final response = await dio.post(
      StringConst.apiUrl,
      data: regBody,
    );

    if (response.statusCode == 200) {
      return response
          .data['candidates'].first['content']['parts'].first['text'];
    } else {
      throw ServerException('Failed to generate message');
    }
  }
}
