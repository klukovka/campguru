import 'package:domain/domain.dart';

extension SortByExt on SortBy {
  String get apiValue => switch (this) {
        SortBy.rating => 'rating',
        SortBy.routes => 'routes',
        SortBy.reviews => 'reviews',
        SortBy.date => 'date',
        SortBy.distance => 'distance',
        SortBy.users => 'users',
      };
}
