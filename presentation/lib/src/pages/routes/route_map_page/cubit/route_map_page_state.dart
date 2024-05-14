part of 'route_map_page_cubit.dart';

class RouteMapPageState extends Equatable {
  final Route route;
  final bool isLoading;
  final bool hasError;

  const RouteMapPageState({
    this.route = const Route(
      id: -1,
      name: '',
      mark: 0,
      reviewsAmount: 0,
      isFavorite: false,
      mapUrl: '',
      distance: 0,
      duration: 0,
    ),
    this.isLoading = true,
    this.hasError = false,
  });

  @override
  List<Object> get props => [route, isLoading, hasError];

  RouteMapPageState copyWith({
    Route? route,
    bool? isLoading,
    bool? hasError,
  }) {
    return RouteMapPageState(
      route: route ?? this.route,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
