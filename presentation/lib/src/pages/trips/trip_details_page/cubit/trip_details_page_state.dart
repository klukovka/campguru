part of 'trip_details_page_cubit.dart';

class TripDetailsPageState extends Equatable {
  final Trip trip;
  final bool isLoading;
  final bool hasError;
  final bool isCompleteLoading;

  const TripDetailsPageState({
    required this.trip,
    this.isLoading = true,
    this.hasError = false,
    this.isCompleteLoading = false,
  });

  Route get route => trip.route;

  @override
  List<Object> get props => [trip, isLoading, hasError, isCompleteLoading];

  TripDetailsPageState copyWith({
    Trip? trip,
    bool? isLoading,
    bool? hasError,
    bool? isCompleteLoading,
  }) {
    return TripDetailsPageState(
      trip: trip ?? this.trip,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      isCompleteLoading: isCompleteLoading ?? this.isCompleteLoading,
    );
  }
}
