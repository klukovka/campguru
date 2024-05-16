part of 'cached_routes_tab_cubit.dart';

class CachedRoutesTabState extends Equatable {
  final String searchQuery;
  final List<Route> routes;

  const CachedRoutesTabState({
    this.searchQuery = '',
    this.routes = const [],
  });

  CachedRoutesTabState copyWith({
    String? searchQuery,
    List<Route>? routes,
  }) {
    return CachedRoutesTabState(
      searchQuery: searchQuery ?? this.searchQuery,
      routes: routes ?? this.routes,
    );
  }

  @override
  List<Object> get props => [searchQuery, routes];
}
