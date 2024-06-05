import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';

extension SortByExtension on SortBy {
  String getLabel(BuildContext context) => switch (this) {
        SortBy.rating => context.strings.rating,
        SortBy.routes => context.strings.routes,
        SortBy.reviews => context.strings.reviews,
        SortBy.date => context.strings.date,
        SortBy.distance => context.strings.distance,
        SortBy.users => context.strings.users,
      };
}
