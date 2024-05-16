part of 'favorite_routes_tab_cubit.dart';

class FavoriteRoutesTabState extends Equatable {
  final Filter filter;
  final bool isLoading;
  final int totslRoutesAmount;
  final List<Route> routes;

  const FavoriteRoutesTabState({
    this.filter = const Filter(),
    this.isLoading = true,
    this.totslRoutesAmount = 0,
    this.routes = const [],
  });

  bool get isFirstLoading => isLoading && filter.page == 0;

  FavoriteRoutesTabState copyWith({
    Filter? filter,
    bool? isLoading,
    int? totslRoutesAmount,
    List<Route>? routes,
  }) {
    return FavoriteRoutesTabState(
      filter: filter ?? this.filter,
      isLoading: isLoading ?? this.isLoading,
      totslRoutesAmount: totslRoutesAmount ?? this.totslRoutesAmount,
      routes: routes ?? this.routes,
    );
  }

  @override
  List<Object> get props => [filter, isLoading, totslRoutesAmount, routes];
}
