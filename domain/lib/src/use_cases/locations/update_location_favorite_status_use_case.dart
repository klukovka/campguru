import 'package:domain/domain.dart';

class UpdateLocationFavoriteStatusUseCase {
  final LocationsRepository locationsRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final LocationsOutputPort locationsOutputPort;

  UpdateLocationFavoriteStatusUseCase({
    required this.locationsRepository,
    required this.errorHandlerOutputPort,
    required this.locationsOutputPort,
  });

  Future<void> call(int locationId, bool isFavorite) async {
    locationsOutputPort.updateLocationFavoriteStatus(locationId, isFavorite);

    final response = isFavorite
        ? await locationsRepository.addLocationToFavorites(locationId)
        : await locationsRepository.removeLocationFromFavorites(locationId);

    if (response.hasFailed) {
      errorHandlerOutputPort.setError(response.failure!);
      locationsOutputPort.updateLocationFavoriteStatus(locationId, !isFavorite);
    }
  }
}
