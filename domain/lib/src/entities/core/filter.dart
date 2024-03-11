import 'package:domain/domain.dart';

class Filter {
  final int page;
  final int size;
  final String? search;
  final SortBy? sortBy;
  final Direction? direction;
  final List<FilterLabel>? labels;

  Filter({
    this.page = 0,
    this.size = 20,
    this.search,
    this.sortBy,
    this.direction,
    this.labels,
  });
}
