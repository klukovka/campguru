import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

extension FilterLabelExtension on FilterLabel {
  String getLabel(BuildContext context) => switch (this) {
        //TODO: Add localizations
        FilterLabel.showNearest => 'Show Nearest',
        FilterLabel.nature => 'Nature',
        FilterLabel.river => 'River',
        FilterLabel.mountains => 'Mountains',
        FilterLabel.forest => 'Forest',
        FilterLabel.animals => 'Animals',
        FilterLabel.hasInternet => 'Has Internet',
        FilterLabel.cafe => 'Cafe',
        FilterLabel.wc => 'WC',
        FilterLabel.showUncompleted => 'Show Uncompleted',
      };
}
