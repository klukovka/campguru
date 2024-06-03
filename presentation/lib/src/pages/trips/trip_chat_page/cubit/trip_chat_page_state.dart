part of 'trip_chat_page_cubit.dart';

class TripChatPageState extends Equatable {
  final Trip? trip;
  final List<Message> paginatedMessages;
  final bool isLoading;
  final String currentUserId;

  const TripChatPageState({
    this.trip,
    this.paginatedMessages = const [],
    this.isLoading = false,
    this.currentUserId = '',
  });

  @override
  List<Object?> get props => [
        trip,
        paginatedMessages,
        isLoading,
        currentUserId,
      ];

  TripChatPageState copyWith({
    Trip? trip,
    List<Message>? paginatedMessages,
    bool? isLoading,
    String? currentUserId,
  }) {
    return TripChatPageState(
      trip: trip ?? this.trip,
      paginatedMessages: paginatedMessages ?? this.paginatedMessages,
      isLoading: isLoading ?? this.isLoading,
      currentUserId: currentUserId ?? this.currentUserId,
    );
  }
}
