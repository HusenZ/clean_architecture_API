abstract class ChatEvents {}

class GenerateChatEvent extends ChatEvents {
  final String userMesg;

  GenerateChatEvent({required this.userMesg});
}
