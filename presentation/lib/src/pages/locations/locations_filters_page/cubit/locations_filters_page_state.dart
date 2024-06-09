part of 'locations_filters_page_cubit.dart';

class LocationsFiltersPageState extends Equatable {
  final Filter filter;
  final List<PremiumBasedFilterLabel> labels;
  final bool isLoading;
  final bool hasPremium;

  const LocationsFiltersPageState({
    this.filter = const Filter(),
    this.labels = const [],
    this.isLoading = false,
    this.hasPremium = false,
  });

  List<PremiumBasedFilterLabel> getDisabledLabels(
    List<PremiumBasedFilterLabel> selectedLabels,
  ) {
    if (hasPremium) return [];
    if (selectedLabels.length < 3) {
      return labels.where((element) => element.isPremium).toList();
    }

    return labels
        .where((element) => !selectedLabels.contains(element))
        .toList();
  }

  bool isLabelAvailable(PremiumBasedFilterLabel label) {
    if (hasPremium) return true;
    return !label.isPremium;
  }

  @override
  List<Object> get props => [filter, labels, isLoading, hasPremium];

  LocationsFiltersPageState copyWith({
    Filter? filter,
    List<PremiumBasedFilterLabel>? labels,
    bool? isLoading,
    bool? hasPremium,
  }) {
    return LocationsFiltersPageState(
      filter: filter ?? this.filter,
      labels: labels ?? this.labels,
      isLoading: isLoading ?? this.isLoading,
      hasPremium: hasPremium ?? this.hasPremium,
    );
  }
}
