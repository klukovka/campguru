part of 'trip_chat_page_cubit.dart';

class TripChatPageState extends Equatable {
  final Trip? trip;

  const TripChatPageState({
    this.trip,
  });

  @override
  List<Object?> get props => [trip];

  TripChatPageState copyWith({
    Trip? trip,
  }) {
    return TripChatPageState(
      trip: trip ?? this.trip,
    );
  }
}
