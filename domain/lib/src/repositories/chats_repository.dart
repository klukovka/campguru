import 'package:domain/domain.dart';

abstract class ChatsRepository {
  Future<FailureOrResult<void>> createTripChat(
    Trip trip,
    String currentUserId,
  );

  Future<FailureOrResult<void>> sendMessage(NewMessage newMessage);

  Future<FailureOrResult<Message?>> getFirstUnreadMessage({
    required String userId,
    required String chatId,
  });

  Future<FailureOrResult<List<Message>>> getAfterMessage({
    required String chatId,
    required String messageId,
  });

  Future<FailureOrResult<List<Message>>> getBeforeMessage({
    required String chatId,
    String? messageId,
  });
}
