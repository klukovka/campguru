import 'package:domain/domain.dart';

class LocationFavoriteButtonController {
  final UpdateLocationFavoriteStatusUseCase updateLocationFavoriteStatusUseCase;

  LocationFavoriteButtonController(this.updateLocationFavoriteStatusUseCase);

  void addToFavorites(int locationId) {
    updateLocationFavoriteStatusUseCase(locationId, true);
  }

  void removeFromFavorites(int locationId) {
    updateLocationFavoriteStatusUseCase(locationId, false);
  }
}
