part of 'cached_route_details_page_cubit.dart';

class CachedRouteDetailsPageState extends Equatable {
  final Route route;

  const CachedRouteDetailsPageState({
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
  });

  @override
  List<Object> get props => [route];

  CachedRouteDetailsPageState copyWith({
    Route? route,
  }) {
    return CachedRouteDetailsPageState(
      route: route ?? this.route,
    );
  }
}
