import 'package:domain/domain.dart';

class TripChatController {
  final SendMessageUseCase sendMessageUseCase;
  final GetFirstMessagesPageUseCase getFirstMessagesPageUseCase;

  TripChatController({
    required this.sendMessageUseCase,
    required this.getFirstMessagesPageUseCase,
  });

  void init(String chatId) {
    getFirstMessagesPageUseCase(chatId);
  }

  void sendMessage({
    required String text,
    required String chatId,
    required List<User>? users,
  }) {
    sendMessageUseCase(
      NewMessage(
        text: text.trim(),
        userId: '',
        chatId: chatId,
        unread: (users ?? []).map((e) => e.id.toString()).toList(),
      ),
    );
  }
}
