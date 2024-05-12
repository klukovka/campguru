part of 'trip_details_page_cubit.dart';

class TripDetailsPageState extends Equatable {
  final Trip trip;
  final bool isLoading;
  final bool hasError;

  const TripDetailsPageState({
    required this.trip,
    this.isLoading = true,
    this.hasError = false,
  });

  Route get route => trip.route;

  @override
  List<Object> get props => [trip, isLoading, hasError];

  TripDetailsPageState copyWith({
    Trip? trip,
    bool? isLoading,
    bool? hasError,
  }) {
    return TripDetailsPageState(
      trip: trip ?? this.trip,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
