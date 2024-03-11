part of 'locations_tab_cubit.dart';

class LocationsTabState extends Equatable {
  final Filter filter;
  final bool isLoading;
  final int totslLocationsAmount;
  final List<Location> locations;

  const LocationsTabState({
    this.filter = const Filter(),
    this.isLoading = true,
    this.totslLocationsAmount = 0,
    this.locations = const [],
  });

  bool get isFirstLoading => isLoading && locations.isEmpty;

  LocationsTabState copyWith({
    Filter? filter,
    bool? isLoading,
    int? totslLocationsAmount,
    List<Location>? locations,
  }) {
    return LocationsTabState(
      filter: filter ?? this.filter,
      isLoading: isLoading ?? this.isLoading,
      totslLocationsAmount: totslLocationsAmount ?? this.totslLocationsAmount,
      locations: locations ?? this.locations,
    );
  }

  @override
  List<Object> get props =>
      [filter, isLoading, totslLocationsAmount, locations];
}
