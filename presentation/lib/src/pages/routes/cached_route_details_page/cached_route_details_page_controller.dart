import 'package:domain/domain.dart';

class CachedRouteDetailsPageController {
  final GetCachedRouteDetailsUseCase getCachedRouteDetailsUseCase;

  CachedRouteDetailsPageController(this.getCachedRouteDetailsUseCase);

  void call(int routeId) {
    getCachedRouteDetailsUseCase(routeId);
  }
}
