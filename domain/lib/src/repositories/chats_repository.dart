import 'package:domain/domain.dart';

abstract class ChatsRepository {
  Future<FailureOrResult<void>> createTripChat(
    Trip trip,
    String currentUserId,
  );

  Future<FailureOrResult<void>> sendMessage(NewMessage newMessage);
}
