import 'package:domain/domain.dart';

class GetFavoriteLocationsUseCase {
  final LocationsRepository locationsRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final LocationsOutputPort locationsOutputPort;

  GetFavoriteLocationsUseCase({
    required this.locationsRepository,
    required this.errorHandlerOutputPort,
    required this.locationsOutputPort,
  });

  Future<void> call(Filter filter) async {
    locationsOutputPort.setFavoriteLocationsFilter(filter);
    final locations = await locationsRepository.getFavoriteLocations(filter);

    if (locations.wasSuccessful) {
      locationsOutputPort.updateFavoriteLocations(
        locations.result!.values,
        locations.result!.fullCount,
      );
      return;
    }

    errorHandlerOutputPort.setError(locations.failure!);
    locationsOutputPort.stopFavoriteLocationsLoading();
  }
}
