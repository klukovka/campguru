import 'package:domain/domain.dart';

class TripChatController {
  final SendMessageUseCase sendMessageUseCase;

  TripChatController({
    required this.sendMessageUseCase,
  });

  void sendMessage({
    required String text,
    required String chatId,
  }) {
    sendMessageUseCase(
      NewMessage(text: text, userId: '', chatId: chatId),
    );
  }
}
