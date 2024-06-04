import 'package:domain/domain.dart';

class TripChatController {
  final SendMessageUseCase sendMessageUseCase;
  final GetFirstMessagesPageUseCase getFirstMessagesPageUseCase;
  final GetNextMessagesPageUseCase getNextMessagesPageUseCase;
  final GetPreviousMessagesPageUseCase getPreviousMessagesPageUseCase;
  final GetNewMessagesStreamUseCase getNewMessagesStreamUseCase;

  TripChatController({
    required this.sendMessageUseCase,
    required this.getFirstMessagesPageUseCase,
    required this.getNextMessagesPageUseCase,
    required this.getPreviousMessagesPageUseCase,
    required this.getNewMessagesStreamUseCase,
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

  void uploadPreviousPage({
    required String chatId,
    required String lastMessageId,
  }) {
    getPreviousMessagesPageUseCase(chatId, lastMessageId);
  }

  void initStream({
    required String chatId,
    required String? lastMessageId,
  }) {
    getNewMessagesStreamUseCase(chatId, lastMessageId);
  }
}
