part of 'locations_filters_page_cubit.dart';

class LocationsFiltersPageState extends Equatable {
  final Filter filter;
  final List<LocationFilterLabel> labels;
  final bool isLoading;

  const LocationsFiltersPageState({
    this.filter = const Filter(),
    this.labels = const [],
    this.isLoading = false,
  });

  List<FilterLabel> get filterLabels => labels.map((e) => e.name).toList();

  @override
  List<Object> get props => [filter, labels, isLoading];

  LocationsFiltersPageState copyWith({
    Filter? filter,
    List<LocationFilterLabel>? labels,
    bool? isLoading,
  }) {
    return LocationsFiltersPageState(
      filter: filter ?? this.filter,
      labels: labels ?? this.labels,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
