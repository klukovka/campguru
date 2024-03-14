part of 'routes_tab_cubit.dart';

class RoutesTabState extends Equatable {
  final Filter filter;
  final bool isLoading;
  final int totslRoutesAmount;
  final List<Route> routes;

  const RoutesTabState({
    this.filter = const Filter(),
    this.isLoading = true,
    this.totslRoutesAmount = 0,
    this.routes = const [],
  });

  bool get isFirstLoading => isLoading && routes.isEmpty;

  RoutesTabState copyWith({
    Filter? filter,
    bool? isLoading,
    int? totslRoutesAmount,
    List<Route>? routes,
  }) {
    return RoutesTabState(
      filter: filter ?? this.filter,
      isLoading: isLoading ?? this.isLoading,
      totslRoutesAmount: totslRoutesAmount ?? this.totslRoutesAmount,
      routes: routes ?? this.routes,
    );
  }

  @override
  List<Object> get props => [filter, isLoading, totslRoutesAmount, routes];
}
