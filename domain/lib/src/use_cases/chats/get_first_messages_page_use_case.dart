import 'package:domain/domain.dart';

class GetFirstMessagesPageUseCase {
  final ChatsRepository chatsRepository;
  final PreferencesRepository preferencesRepository;
  final ChatsOutputPort chatsOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  GetFirstMessagesPageUseCase({
    required this.chatsRepository,
    required this.preferencesRepository,
    required this.chatsOutputPort,
    required this.errorHandlerOutputPort,
  });

  Future<void> call(String chatId) async {
    final userId = preferencesRepository.userId.toString();
    chatsOutputPort.startChatLoading(userId);
    final firstMessage = await chatsRepository.getFirstUnreadMessage(
      userId: userId,
      chatId: chatId,
    );

    if (firstMessage.hasFailed) {
      errorHandlerOutputPort.setError(firstMessage.failure!);
      return;
    }

    if (firstMessage.result != null) {
      final messages = await chatsRepository.getAfterMessage(
        chatId: chatId,
        messageId: firstMessage.result!.id,
      );
      if (messages.hasFailed) {
        errorHandlerOutputPort.setError(messages.failure!);
        return;
      }
      chatsOutputPort.updateFirstPage(
        [firstMessage.result!, ...messages.result!],
      );

      for (final message in [firstMessage.result!, ...messages.result!]) {
        if (!message.isRead(userId)) {
          chatsRepository.readMessage(
            chatId: chatId,
            messageId: message.id,
            userId: userId,
          );
        }
      }
    } else {
      final messages = await chatsRepository.getBeforeMessage(
        chatId: chatId,
      );
      if (messages.hasFailed) {
        errorHandlerOutputPort.setError(messages.failure!);
        return;
      }
      chatsOutputPort.updateFirstPage(messages.result!);
    }
  }
}
