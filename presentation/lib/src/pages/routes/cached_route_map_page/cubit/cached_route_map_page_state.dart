part of 'cached_route_map_page_cubit.dart';

class CachedRouteMapPageState extends Equatable {
  final Route route;
  final bool isGeopositionEnabled;
  final LatLng currentPosition;
  const CachedRouteMapPageState({
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
    this.isGeopositionEnabled = false,
    this.currentPosition = const LatLng(0, 0),
  });

  @override
  List<Object> get props => [route, isGeopositionEnabled, currentPosition];

  List<flutter_map.LatLng> get locations =>
      route.locations?.map((e) => e.toMapParams()).toList() ?? [];

  List<flutter_map.LatLng> get polyline =>
      route.polyline?.map((e) => e.toMapParams()).toList() ?? [];

  LatLngBounds get bounds => polyline.getBounds();

  flutter_map.LatLng get mapCurrentPosition => currentPosition.toMapParams();

  CachedRouteMapPageState copyWith({
    Route? route,
    bool? isGeopositionEnabled,
    LatLng? currentPosition,
  }) {
    return CachedRouteMapPageState(
      route: route ?? this.route,
      isGeopositionEnabled: isGeopositionEnabled ?? this.isGeopositionEnabled,
      currentPosition: currentPosition ?? this.currentPosition,
    );
  }
}
