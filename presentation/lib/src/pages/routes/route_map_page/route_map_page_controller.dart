import 'package:domain/domain.dart';

class RouteMapPageController {
  final CacheRouteUseCase cacheRouteUseCase;
  final GetRouteDetailsUseCase getRouteDetailsUseCase;
  final GetGeopositionUseCase getGeopositionUseCase;

  RouteMapPageController({
    required this.cacheRouteUseCase,
    required this.getRouteDetailsUseCase,
    required this.getGeopositionUseCase,
  });

  void cache(Route route) {
    cacheRouteUseCase(route);
  }

  void getDetails(int routeId) {
    getRouteDetailsUseCase(routeId);
    getGeopositionUseCase();
  }
}
