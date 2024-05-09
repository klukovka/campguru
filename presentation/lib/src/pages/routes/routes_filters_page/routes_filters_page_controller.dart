import 'package:domain/domain.dart';

class RouteFiltersPageController {
  final GetAllRoutesUseCase getAllRoutesUseCase;

  RouteFiltersPageController(this.getAllRoutesUseCase);

  void setFilters(
    Filter currentFilter,
    SortBy? sortBy,
    List<FilterLabel>? labels,
    (int, int)? distanceRange,
  ) {
    final filter = currentFilter.copyWith(
      page: 0,
      sortBy: Nullable(sortBy),
      labels: Nullable(labels),
      distanceRange: Nullable(distanceRange),
    );

    getAllRoutesUseCase(filter);
  }
}
