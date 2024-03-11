import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class Filter extends Equatable {
  final int page;
  final int size;
  final String? search;
  final SortBy? sortBy;
  final Direction? direction;
  final List<FilterLabel>? labels;

  const Filter({
    this.page = 0,
    this.size = 20,
    this.search,
    this.sortBy,
    this.direction,
    this.labels,
  });

  bool get append => page > 0;

  @override
  List<Object?> get props {
    return [
      page,
      size,
      search,
      sortBy,
      direction,
      labels,
    ];
  }

  Filter copyWith({
    int? page,
    int? size,
    String? search,
    SortBy? sortBy,
    Direction? direction,
    List<FilterLabel>? labels,
  }) {
    return Filter(
      page: page ?? this.page,
      size: size ?? this.size,
      search: search ?? this.search,
      sortBy: sortBy ?? this.sortBy,
      direction: direction ?? this.direction,
      labels: labels ?? this.labels,
    );
  }
}
