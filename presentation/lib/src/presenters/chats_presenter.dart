import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class ChatsPresenter implements ChatsOutputPort {
  final TripChatPageCubit tripChatPageCubit;

  ChatsPresenter({required this.tripChatPageCubit});

  @override
  void startChatLoading([String? currentUserId]) {
    tripChatPageCubit.startLoading(currentUserId);
  }

  @override
  void updateFirstPage(List<Message> messages) {
    tripChatPageCubit.updateFirstPage(messages);
  }

  @override
  void stopChatLoading() {
    tripChatPageCubit.stopLoading();
  }

  @override
  void addNextMessagesPage(List<Message> messages) {
    tripChatPageCubit.addNextMessagesPage(messages);
  }

  @override
  void addPreviousMessagesPage(List<Message> messages) {
    tripChatPageCubit.addPreviousMessagesPage(messages);
  }

  @override
  void setInitedStream(bool isInited) {
    tripChatPageCubit.initStream(isInited);
  }

  @override
  void updateStreamMessages(List<Message> messages) {
    tripChatPageCubit.updateStreamMessages(messages);
  }
}
