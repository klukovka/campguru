part of 'trips_filters_page_cubit.dart';

class TripsFiltersPageState extends Equatable {
  final Filter filter;
  final bool isLoading;

  const TripsFiltersPageState({
    this.filter = const Filter(),
    this.isLoading = false,
  });

  @override
  List<Object> get props => [filter, isLoading];

  TripsFiltersPageState copyWith({
    Filter? filter,
    bool? isLoading,
  }) {
    return TripsFiltersPageState(
      filter: filter ?? this.filter,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
