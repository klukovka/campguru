part of 'route_locations_page_cubit.dart';

class RouteLocationsPageState extends Equatable {
  final Filter filter;
  final bool isLoading;
  final int totslLocationsAmount;
  final List<Location> locations;

  const RouteLocationsPageState({
    this.filter = const Filter(),
    this.isLoading = true,
    this.totslLocationsAmount = 0,
    this.locations = const [],
  });

  bool get isFirstLoading => isLoading && locations.isEmpty;

  RouteLocationsPageState copyWith({
    Filter? filter,
    bool? isLoading,
    int? totslLocationsAmount,
    List<Location>? locations,
  }) {
    return RouteLocationsPageState(
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
