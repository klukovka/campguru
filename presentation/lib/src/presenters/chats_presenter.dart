import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class ChatsPresenter implements ChatsOutputPort {
  final TripChatPageCubit tripChatPageCubit;

  ChatsPresenter({required this.tripChatPageCubit});

  @override
  void startChatLoading(String currentUserId) {
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
}
