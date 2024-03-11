import 'package:domain/domain.dart';

class LocationTileController {
  final UpdateLocationFavoriteStatusUseCase updateLocationFavoriteStatusUseCase;

  LocationTileController(this.updateLocationFavoriteStatusUseCase);

  void addToFavorites(int locationId) {
    updateLocationFavoriteStatusUseCase(locationId, true);
  }

  void removeFromFavorites(int locationId) {
    updateLocationFavoriteStatusUseCase(locationId, false);
  }
}
