import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';

extension FilterLabelExtension on FilterLabel {
  String getLabel(BuildContext context) => switch (this) {
        FilterLabel.showNearest => context.strings.showNearest,
        FilterLabel.nature => context.strings.nature,
        FilterLabel.river => context.strings.river,
        FilterLabel.mountains => context.strings.mountains,
        FilterLabel.forest => context.strings.forest,
        FilterLabel.animals => context.strings.animals,
        FilterLabel.hasInternet => context.strings.hasInternet,
        FilterLabel.cafe => context.strings.cafe,
        FilterLabel.wc => context.strings.wc,
        FilterLabel.showUncompleted => context.strings.showUncompleted,
      };
}
