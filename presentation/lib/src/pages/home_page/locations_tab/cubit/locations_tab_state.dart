part of 'locations_tab_cubit.dart';

class LocationsTabState extends Equatable {
  final Filter filter;
  final bool isLoading;
  final int locationsAmount;
  final List<Location> locations;

  const LocationsTabState({
    this.filter = const Filter(),
    this.isLoading = true,
    this.locationsAmount = 0,
    this.locations = const [],
  });

  LocationsTabState copyWith({
    Filter? filter,
    bool? isLoading,
    int? locationsAmount,
    List<Location>? locations,
  }) {
    return LocationsTabState(
      filter: filter ?? this.filter,
      isLoading: isLoading ?? this.isLoading,
      locationsAmount: locationsAmount ?? this.locationsAmount,
      locations: locations ?? this.locations,
    );
  }

  @override
  List<Object> get props => [filter, isLoading, locationsAmount, locations];
}
