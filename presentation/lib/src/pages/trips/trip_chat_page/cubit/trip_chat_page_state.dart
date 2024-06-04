part of 'trip_chat_page_cubit.dart';

class TripChatPageState extends Equatable {
  final Trip? trip;
  final List<Message> paginatedMessages;
  final bool isLoading;
  final String currentUserId;
  final bool isAllNewMessagesUploaded;

  const TripChatPageState({
    this.trip,
    this.paginatedMessages = const [],
    this.isLoading = false,
    this.currentUserId = '',
    this.isAllNewMessagesUploaded = false,
  });

  List<Message> get messages => [...paginatedMessages];

  @override
  List<Object?> get props => [
        trip,
        paginatedMessages,
        isLoading,
        currentUserId,
        isAllNewMessagesUploaded,
      ];

  User? getUser(String userId) =>
      trip?.users?.firstWhereOrNull((user) => user.id.toString() == userId);

  TripChatPageState copyWith({
    Trip? trip,
    List<Message>? paginatedMessages,
    bool? isLoading,
    String? currentUserId,
    bool? isAllNewMessagesUploaded,
  }) {
    return TripChatPageState(
      trip: trip ?? this.trip,
      paginatedMessages: paginatedMessages ?? this.paginatedMessages,
      isLoading: isLoading ?? this.isLoading,
      currentUserId: currentUserId ?? this.currentUserId,
      isAllNewMessagesUploaded:
          isAllNewMessagesUploaded ?? this.isAllNewMessagesUploaded,
    );
  }
}
