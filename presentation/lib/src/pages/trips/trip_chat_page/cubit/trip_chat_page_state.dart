part of 'trip_chat_page_cubit.dart';

class TripChatPageState extends Equatable {
  final Trip? trip;
  final List<Message> paginatedMessages;
  final bool isLoading;

  const TripChatPageState({
    this.trip,
    this.paginatedMessages = const [],
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [trip, paginatedMessages, isLoading];

  TripChatPageState copyWith({
    Trip? trip,
    List<Message>? paginatedMessages,
    bool? isLoading,
  }) {
    return TripChatPageState(
      trip: trip ?? this.trip,
      paginatedMessages: paginatedMessages ?? this.paginatedMessages,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
