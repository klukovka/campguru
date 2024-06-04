part of 'trip_chat_page_cubit.dart';

class TripChatPageState extends Equatable {
  final Trip? trip;
  final List<Message> paginatedMessages;
  final List<Message> streamMessages;
  final bool isLoading;
  final String currentUserId;
  final bool isAllNewMessagesUploaded;
  final bool isAllPreviousMessagesUploaded;
  final bool isStreamInited;

  const TripChatPageState({
    this.trip,
    this.paginatedMessages = const [],
    this.isLoading = false,
    this.currentUserId = '',
    this.isAllNewMessagesUploaded = false,
    this.isAllPreviousMessagesUploaded = false,
    this.isStreamInited = false,
    this.streamMessages = const [],
  });

  List<Message> get messages => [...paginatedMessages, ...streamMessages];

  @override
  List<Object?> get props => [
        trip,
        paginatedMessages,
        isLoading,
        currentUserId,
        isAllNewMessagesUploaded,
        isAllPreviousMessagesUploaded,
        isStreamInited,
        streamMessages,
      ];

  User? getUser(String userId) =>
      trip?.users?.firstWhereOrNull((user) => user.id.toString() == userId);

  TripChatPageState copyWith({
    Trip? trip,
    List<Message>? paginatedMessages,
    List<Message>? streamMessages,
    bool? isLoading,
    String? currentUserId,
    bool? isAllNewMessagesUploaded,
    bool? isAllPreviousMessagesUploaded,
    bool? isStreamInited,
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
      streamMessages: streamMessages ?? this.streamMessages,
      isStreamInited: isStreamInited ?? this.isStreamInited,
    );
  }
}
