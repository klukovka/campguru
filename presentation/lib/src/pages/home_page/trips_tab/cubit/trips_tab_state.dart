part of 'trips_tab_cubit.dart';

class TripsTabState extends Equatable {
  final Filter filter;
  final bool isLoading;
  final int totslTripsAmount;
  final List<Trip> trips;

  const TripsTabState({
    this.filter = const Filter(),
    this.isLoading = true,
    this.totslTripsAmount = 0,
    this.trips = const [],
  });

  bool get isFirstLoading => isLoading && trips.isEmpty;

  TripsTabState copyWith({
    Filter? filter,
    bool? isLoading,
    int? totslTripsAmount,
    List<Trip>? trips,
  }) {
    return TripsTabState(
      filter: filter ?? this.filter,
      isLoading: isLoading ?? this.isLoading,
      totslTripsAmount: totslTripsAmount ?? this.totslTripsAmount,
      trips: trips ?? this.trips,
    );
  }

  @override
  List<Object> get props => [filter, isLoading, totslTripsAmount, trips];
}
