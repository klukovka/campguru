import 'package:domain/domain.dart';

class TripChatController {
  final SendMessageUseCase sendMessageUseCase;
  final GetFirstMessagesPageUseCase getFirstMessagesPageUseCase;
  final GetNextMessagesPageUseCase getNextMessagesPageUseCase;

  TripChatController({
    required this.sendMessageUseCase,
    required this.getFirstMessagesPageUseCase,
    required this.getNextMessagesPageUseCase,
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

  void uploadNextPage({
    required String chatId,
    required String lastMessageId,
  }) {
    getNextMessagesPageUseCase(chatId, lastMessageId);
  }
}
