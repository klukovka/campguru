import 'package:domain/domain.dart';

class GetPreviousMessagesPageUseCase {
  final ChatsRepository chatsRepository;
  final ChatsOutputPort chatsOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  GetPreviousMessagesPageUseCase({
    required this.chatsRepository,
    required this.chatsOutputPort,
    required this.errorHandlerOutputPort,
  });

  Future<void> call(String chatId, String lastMessageId) async {
    chatsOutputPort.startChatLoading();
    final messages = await chatsRepository.getBeforeMessage(
      chatId: chatId,
      messageId: lastMessageId,
    );
    if (messages.hasFailed) {
      errorHandlerOutputPort.setError(messages.failure!);
      chatsOutputPort.stopChatLoading();
      return;
    }

    chatsOutputPort
      ..addPreviousMessagesPage(messages.result!)
      ..stopChatLoading();
  }
}
