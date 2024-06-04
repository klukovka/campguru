import 'dart:async';

import 'package:domain/domain.dart';

class GetNewMessagesStreamUseCase {
  final PreferencesRepository preferencesRepository;
  final ChatsRepository chatsRepository;
  final ChatsOutputPort chatsOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  StreamSubscription<List<Message>>? _subscription;

  GetNewMessagesStreamUseCase({
    required this.preferencesRepository,
    required this.chatsRepository,
    required this.chatsOutputPort,
    required this.errorHandlerOutputPort,
  });

  Future<void> call(String chatId, String? lastMessageId) async {
    _subscription?.cancel();
    chatsOutputPort.setInitedStream(false);
    final stream = await chatsRepository.getNewMessagesStream(
      chatId: chatId,
      lastMessageId: lastMessageId,
    );

    if (stream.hasFailed) {
      errorHandlerOutputPort.setError(stream.failure!);
      return;
    }

    chatsOutputPort.setInitedStream(true);
    _subscription = stream.result?.listen((messages) {
      final userId = preferencesRepository.userId.toString();
      chatsOutputPort.updateStreamMessages(messages);
      for (final message in messages) {
        chatsRepository.readMessage(
          chatId: chatId,
          messageId: message.id,
          userId: userId,
        );
      }
    });
  }
}
