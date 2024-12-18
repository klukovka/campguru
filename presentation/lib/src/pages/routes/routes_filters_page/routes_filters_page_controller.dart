import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class RouteFiltersPageController {
  final GetAllRoutesUseCase getAllRoutesUseCase;

  RouteFiltersPageController(this.getAllRoutesUseCase);

  void setFilters(
    Filter currentFilter,
    SortBy? sortBy,
    List<PremiumBasedFilterLabel>? labels,
    RangeValues? distanceRange,
  ) {
    final filter = currentFilter.copyWith(
      page: 1,
      sortBy: Nullable(sortBy),
      labels: Nullable(labels),
      distanceRange: Nullable(distanceRange == null || distanceRange.end == 0
          ? null
          : (distanceRange.start, distanceRange.end)),
    );

    getAllRoutesUseCase(filter);
  }
}
