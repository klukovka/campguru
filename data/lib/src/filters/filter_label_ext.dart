import 'package:domain/domain.dart';

extension FilterLabelExt on FilterLabel {
  String get apiValue => switch (this) {
        FilterLabel.showNearest => 'show_nearest',
        FilterLabel.nature => 'nature',
        FilterLabel.river => 'river',
        FilterLabel.mountains => 'mountains',
        FilterLabel.forest => 'forest',
        FilterLabel.animals => 'animals',
        FilterLabel.hasInternet => 'has_internet',
        FilterLabel.cafe => 'cafe',
        FilterLabel.wc => 'wc',
        FilterLabel.showUncompleted => 'show_uncompleted',
        FilterLabel.historical => 'historical',
        FilterLabel.cultural => 'cultural',
        FilterLabel.hiking => 'hiking',
        FilterLabel.skiing => 'skiing',
        FilterLabel.lakes => 'lakes',
        FilterLabel.waterfall => 'waterfall',
      };
}
