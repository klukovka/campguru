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
    final message = newMessage.copyWith(
      userId: preferencesRepository.userId.toString(),
    );

    final result = await chatsRepository.sendMessage(message);

    if (result.hasFailed) {
      errorHandlerOutputPort.setError(result.failure!);
    }
  }
}
