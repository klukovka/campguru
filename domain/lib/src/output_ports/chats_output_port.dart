import 'package:domain/domain.dart';

abstract class ChatsOutputPort {
  void startChatLoading(String currentUserId);
  void updateFirstPage(List<Message> messages);
  void stopChatLoading();
}
