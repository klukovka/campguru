import 'package:domain/domain.dart';

class RouteFavoriteButtonController {
  final UpdateRouteFavoriteStatusUseCase updateRouteFavoriteStatusUseCase;

  RouteFavoriteButtonController(this.updateRouteFavoriteStatusUseCase);

  void addToFavorites(int routeId) {
    updateRouteFavoriteStatusUseCase(routeId, true);
  }

  void removeFromFavorites(int routeId) {
    updateRouteFavoriteStatusUseCase(routeId, false);
  }
}
