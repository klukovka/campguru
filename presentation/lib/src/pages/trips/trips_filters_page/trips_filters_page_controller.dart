import 'package:domain/domain.dart';

class TripFiltersPageController {
  final GetTripsUseCase getTripsUseCase;

  TripFiltersPageController(this.getTripsUseCase);

  void setFilters(
    Filter currentFilter,
    SortBy? sortBy,
    List<PremiumBasedFilterLabel>? labels,
  ) {
    final filter = currentFilter.copyWith(
      page: 0,
      sortBy: Nullable(sortBy),
      labels: Nullable(labels),
    );

    getTripsUseCase(filter);
  }
}
