part of 'trip_chat_page_cubit.dart';

class TripChatPageState extends Equatable {
  final Trip? trip;
  final List<Message> paginatedMessages;
  final bool isLoading;
  final String currentUserId;
  final bool isAllNewMessagesUploaded;
  final bool isAllPreviousMessagesUploaded;

  const TripChatPageState({
    this.trip,
    this.paginatedMessages = const [],
    this.isLoading = false,
    this.currentUserId = '',
    this.isAllNewMessagesUploaded = false,
    this.isAllPreviousMessagesUploaded = false,
  });

  List<Message> get messages => [...paginatedMessages];

  @override
  List<Object?> get props => [
        trip,
        paginatedMessages,
        isLoading,
        currentUserId,
        isAllNewMessagesUploaded,
        isAllPreviousMessagesUploaded,
      ];

  User? getUser(String userId) =>
      trip?.users?.firstWhereOrNull((user) => user.id.toString() == userId);

  TripChatPageState copyWith({
    Trip? trip,
    List<Message>? paginatedMessages,
    bool? isLoading,
    String? currentUserId,
    bool? isAllNewMessagesUploaded,
    bool? isAllPreviousMessagesUploaded,
  }) {
    return TripChatPageState(
      trip: trip ?? this.trip,
      paginatedMessages: paginatedMessages ?? this.paginatedMessages,
      isLoading: isLoading ?? this.isLoading,
      currentUserId: currentUserId ?? this.currentUserId,
      isAllNewMessagesUploaded:
          isAllNewMessagesUploaded ?? this.isAllNewMessagesUploaded,
      isAllPreviousMessagesUploaded:
          isAllPreviousMessagesUploaded ?? this.isAllPreviousMessagesUploaded,
    );
  }
}
