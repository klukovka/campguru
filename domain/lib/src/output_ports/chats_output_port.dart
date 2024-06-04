import 'package:domain/domain.dart';

abstract class ChatsOutputPort {
  void startChatLoading([String? currentUserId]);
  void updateFirstPage(List<Message> messages);
  void addNextMessagesPage(List<Message> messages);
  void addPreviousMessagesPage(List<Message> messages);
  void stopChatLoading();
  void setInitedStream(bool isInited);
  void updateStreamMessages(List<Message> messages);
}
