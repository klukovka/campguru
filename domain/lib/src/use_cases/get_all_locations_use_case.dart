import 'package:domain/domain.dart';

class GetAllLocationsUseCase {
  final LocationsRepository locationsRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final LocationsOutputPort locationsOutputPort;

  GetAllLocationsUseCase({
    required this.locationsRepository,
    required this.errorHandlerOutputPort,
    required this.locationsOutputPort,
  });

  Future<void> call(Filter filter) async {
    locationsOutputPort.setAllLocationsFilter(filter);
    final locations = await locationsRepository.getAllLocations(filter);

    if (locations.wasSuccessful) {
      locationsOutputPort.updateAllLocations(
        locations.result!.values,
        locations.result!.fullCount,
      );
      return;
    }

    errorHandlerOutputPort.setError(locations.failure!);
    locationsOutputPort.stopAllLocationsLoading();
  }
}
