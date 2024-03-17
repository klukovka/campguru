import 'package:domain/domain.dart';

class GetRouteLocationsUseCase {
  final LocationsRepository locationsRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final LocationsOutputPort locationsOutputPort;

  GetRouteLocationsUseCase({
    required this.locationsRepository,
    required this.errorHandlerOutputPort,
    required this.locationsOutputPort,
  });

  Future<void> call(int routeId, Filter filter) async {
    locationsOutputPort.setRouteLocationsFilter(filter);
    final locations =
        await locationsRepository.getRouteLocations(routeId, filter);

    if (locations.wasSuccessful) {
      locationsOutputPort.updateRouteLocations(
        locations.result!.values,
        locations.result!.fullCount,
      );
      return;
    }

    errorHandlerOutputPort.setError(locations.failure!);
    locationsOutputPort.stopRouteLocationsLoading();
  }
}
