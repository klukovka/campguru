import 'package:domain/domain.dart';

class LocationFiltersPageController {
  final GetAllLocationsUseCase getAllLocationsUseCase;

  LocationFiltersPageController(this.getAllLocationsUseCase);

  void setFilters(
    Filter currentFilter,
    SortBy? sortBy,
    List<FilterLabel>? labels,
  ) {
    final filter = currentFilter.copyWith(
      page: 0,
      sortBy: Nullable(sortBy),
      labels: Nullable(labels),
    );

    getAllLocationsUseCase(filter);
  }
}
