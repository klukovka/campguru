import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class Filter extends Equatable {
  final int page;
  final int size;
  final String? search;
  final SortBy? sortBy;
  final Direction? direction;
  final List<PremiumBasedFilterLabel>? labels;
  final (double, double)? distanceRange;

  const Filter({
    this.page = 0,
    this.size = 20,
    this.search,
    this.sortBy,
    this.direction,
    this.labels,
    this.distanceRange,
  });

  bool get append => page > 0;

  bool get isNotEmpty =>
      sortBy != null || direction != null || (labels?.isNotEmpty ?? false);

  @override
  List<Object?> get props {
    return [
      page,
      size,
      search,
      sortBy,
      direction,
      labels,
      distanceRange,
    ];
  }

  Filter copyWith({
    int? page,
    int? size,
    String? search,
    Nullable<SortBy>? sortBy,
    Direction? direction,
    Nullable<List<PremiumBasedFilterLabel>>? labels,
    Nullable<(double, double)>? distanceRange,
  }) {
    return Filter(
      page: page ?? this.page,
      size: size ?? this.size,
      search: search ?? this.search,
      sortBy: sortBy == null ? this.sortBy : sortBy.value,
      direction: direction ?? this.direction,
      labels: labels == null ? this.labels : labels.value,
      distanceRange:
          distanceRange == null ? this.distanceRange : distanceRange.value,
    );
  }
}
