part of 'route_map_page_cubit.dart';

class RouteMapPageState extends Equatable {
  final Route route;
  final bool isLoading;
  final bool hasError;
  final bool isGeopositionEnabled;
  final LatLng currentPosition;

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
    this.isGeopositionEnabled = false,
    this.currentPosition = const LatLng(0, 0),
  });

  @override
  List<Object> get props {
    return [
      route,
      isLoading,
      hasError,
      isGeopositionEnabled,
      currentPosition,
    ];
  }

  RouteMapPageState copyWith({
    Route? route,
    bool? isLoading,
    bool? hasError,
    bool? isGeopositionEnabled,
    LatLng? currentPosition,
  }) {
    return RouteMapPageState(
      route: route ?? this.route,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      isGeopositionEnabled: isGeopositionEnabled ?? this.isGeopositionEnabled,
      currentPosition: currentPosition ?? this.currentPosition,
    );
  }
}
