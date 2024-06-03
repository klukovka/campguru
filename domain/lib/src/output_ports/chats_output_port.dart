import 'package:domain/domain.dart';

abstract class ChatsOutputPort {
  void startChatLoading();
  void updateFirstPage(List<Message> messages);
  void stopChatLoading();
}
