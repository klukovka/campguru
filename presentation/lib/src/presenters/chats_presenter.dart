import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class ChatsPresenter implements ChatsOutputPort {
  final TripChatPageCubit tripChatPageCubit;

  ChatsPresenter({required this.tripChatPageCubit});

  @override
  void startChatLoading() {
    tripChatPageCubit.startLoading();
  }

  @override
  void updateFirstPage(List<Message> messages) {
    tripChatPageCubit.updateFirstPage(messages);
  }

  @override
  void stopChatLoading() {
    tripChatPageCubit.stopLoading();
  }
}
