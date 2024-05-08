import 'package:domain/domain.dart';

class RouteDetailsPageController {
  final GetRouteDetailsUseCase getRouteDetailsUseCase;

  RouteDetailsPageController(this.getRouteDetailsUseCase);

  void call(int routeId) {
    getRouteDetailsUseCase(routeId);
  }
}
