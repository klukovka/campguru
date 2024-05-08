import 'package:domain/domain.dart';

class GetLocationsAvailableFiltersUseCase {
  final LocationsRepository locationsRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final LocationsOutputPort locationsOutputPort;

  GetLocationsAvailableFiltersUseCase({
    required this.locationsRepository,
    required this.errorHandlerOutputPort,
    required this.locationsOutputPort,
  });

  Future<void> call() async {
    final labels = await locationsRepository.getLocationsFilterLabels();
    if (labels.wasSuccessful) {
      locationsOutputPort.updateLocationsAvailableFilters(labels.result ?? []);
      return;
    }

    errorHandlerOutputPort.setError(labels.failure!);
  }
}
