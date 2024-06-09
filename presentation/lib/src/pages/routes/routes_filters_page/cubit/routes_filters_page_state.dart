part of 'routes_filters_page_cubit.dart';

class RoutesFiltersPageState extends Equatable {
  final Filter filter;
  final List<PremiumBasedFilterLabel> labels;
  final bool isLoading;
  final bool hasPremium;

  const RoutesFiltersPageState({
    this.filter = const Filter(),
    this.labels = const [],
    this.isLoading = false,
    this.hasPremium = false,
  });

  RangeValues? get distance => filter.distanceRange != null
      ? RangeValues(
          filter.distanceRange!.$1,
          filter.distanceRange!.$2,
        )
      : null;

  List<PremiumBasedFilterLabel> getDisabledLabels(
      List<PremiumBasedFilterLabel> selectedLabels) {
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

  RoutesFiltersPageState copyWith({
    Filter? filter,
    List<PremiumBasedFilterLabel>? labels,
    bool? isLoading,
    bool? hasPremium,
  }) {
    return RoutesFiltersPageState(
      filter: filter ?? this.filter,
      labels: labels ?? this.labels,
      isLoading: isLoading ?? this.isLoading,
      hasPremium: hasPremium ?? this.hasPremium,
    );
  }
}
