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

  List<FilterLabel> get filterLabels => labels.map((e) => e.name).toList();

  List<FilterLabel> getDisabledLabels(List<FilterLabel> selectedLabels) {
    if (hasPremium) return [];
    if (selectedLabels.length < 3) {
      return labels
          .where((element) => element.isPremium)
          .map((e) => e.name)
          .toList();
    }

    return filterLabels
        .where((element) => !selectedLabels.contains(element))
        .toList();
  }

  bool isLabelAvailable(FilterLabel label) {
    if (hasPremium) return true;
    return !labels.singleWhere((element) => element.name == label).isPremium;
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
