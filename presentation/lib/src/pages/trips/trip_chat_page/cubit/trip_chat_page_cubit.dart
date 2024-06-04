import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trip_chat_page_state.dart';

class TripChatPageCubit extends Cubit<TripChatPageState> {
  TripChatPageCubit() : super(const TripChatPageState());

  void updateTrip(Trip trip) => emit(state.copyWith(trip: trip));

  void startLoading(String? currentUserId) => emit(state.copyWith(
        isLoading: true,
        paginatedMessages: currentUserId != null ? [] : null,
        streamMessages: currentUserId != null ? [] : null,
        isStreamInited: currentUserId != null ? false : null,
        currentUserId: currentUserId,
      ));

  void stopLoading() => emit(state.copyWith(isLoading: false));

  void updateFirstPage(List<Message> messages) => emit(state.copyWith(
        paginatedMessages: messages,
        isLoading: false,
      ));

  void addNextMessagesPage(List<Message> messages) => emit(state.copyWith(
        paginatedMessages: [...state.paginatedMessages, ...messages],
        isAllNewMessagesUploaded: messages.isEmpty,
      ));

  void addPreviousMessagesPage(List<Message> messages) => emit(state.copyWith(
        paginatedMessages: [...messages, ...state.paginatedMessages],
        isAllPreviousMessagesUploaded: messages.isEmpty,
      ));

  void updateStreamMessages(List<Message> messages) => emit(state.copyWith(
        streamMessages: messages,
      ));

  void initStream(bool isInited) =>
      emit(state.copyWith(isStreamInited: isInited));
}
