import 'package:domain/domain.dart';

class GetNextMessagesPageUseCase {
  final ChatsRepository chatsRepository;
  final ChatsOutputPort chatsOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  GetNextMessagesPageUseCase({
    required this.chatsRepository,
    required this.chatsOutputPort,
    required this.errorHandlerOutputPort,
  });

  Future<void> call(String chatId, String lastMessageId) async {
    chatsOutputPort.startChatLoading();
    final messages = await chatsRepository.getAfterMessage(
      chatId: chatId,
      messageId: lastMessageId,
    );
    if (messages.hasFailed) {
      errorHandlerOutputPort.setError(messages.failure!);
      chatsOutputPort.stopChatLoading();
      return;
    }

    chatsOutputPort
      ..addNextMessagesPage(messages.result!)
      ..stopChatLoading();
  }
}
