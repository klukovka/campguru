import 'package:domain/domain.dart';

class RouteMapPageController {
  final CacheRouteUseCase cacheRouteUseCase;

  RouteMapPageController(this.cacheRouteUseCase);

  void call(Route route) {
    cacheRouteUseCase(route);
  }
}
