import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

extension SortByExtension on SortBy {
  //TODO: Add localizations
  String getLabel(BuildContext context) => switch (this) {
        SortBy.rating => 'Rating',
        SortBy.routes => 'Routes',
        SortBy.reviews => 'Reviews',
      };
}
