part of 'route_details_page_cubit.dart';

class RouteDetailsPageState extends Equatable {
  final Route route;
  final bool isLoading;
  final bool hasError;

  const RouteDetailsPageState({
    this.route = const Route(
      id: -1,
      name: '',
      mark: 0,
      reviewsAmount: 0,
      isFavorite: false,
      mapUrl: '',
      distance: 0,
      duration: 0,
      isMine: false,
    ),
    this.isLoading = true,
    this.hasError = false,
  });

  @override
  List<Object> get props => [route, isLoading, hasError];

  RouteDetailsPageState copyWith({
    Route? route,
    bool? isLoading,
    bool? hasError,
  }) {
    return RouteDetailsPageState(
      route: route ?? this.route,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
