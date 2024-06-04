import 'package:domain/domain.dart';

class SendMessageUseCase {
  final ChatsRepository chatsRepository;
  final PreferencesRepository preferencesRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  SendMessageUseCase({
    required this.chatsRepository,
    required this.errorHandlerOutputPort,
    required this.preferencesRepository,
  });

  Future<void> call(NewMessage newMessage) async {
    final userId = preferencesRepository.userId.toString();
    final message = newMessage.copyWith(
      userId: userId,
      unread: List.from(newMessage.unread)..remove(userId),
    );

    final result = await chatsRepository.sendMessage(message);

    if (result.hasFailed) {
      errorHandlerOutputPort.setError(result.failure!);
    }
  }
}
