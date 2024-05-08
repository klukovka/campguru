import 'package:domain/domain.dart';

class LocationFiltersPageController {
  final GetAllLocationsUseCase getAllLocationsUseCase;

  LocationFiltersPageController(this.getAllLocationsUseCase);

  void setFilters(
    Filter currentFilter,
    SortBy? sortBy,
    List<LocationFilterLabel>? labels,
  ) {
    final filter = currentFilter.copyWith(
      page: 0,
      sortBy: sortBy,
      labels: labels?.map((e) => e.name).toList(),
    );

    getAllLocationsUseCase(filter);
  }
}
