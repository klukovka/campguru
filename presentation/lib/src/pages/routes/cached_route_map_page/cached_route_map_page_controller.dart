import 'package:domain/domain.dart';

class CachedRouteMapPageController {
  final GetCachedRouteDetailsUseCase getCachedRouteDetailsUseCase;
  final GetGeopositionUseCase getGeopositionUseCase;

  CachedRouteMapPageController({
    required this.getCachedRouteDetailsUseCase,
    required this.getGeopositionUseCase,
  });

  void call(int routeId) {
    getCachedRouteDetailsUseCase(routeId);
    getGeopositionUseCase();
  }
}
