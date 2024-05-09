import 'package:domain/domain.dart';

class GetRoutesAvailableFiltersUseCase {
  final RoutesRepository routesRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final RoutesOutputPort routesOutputPort;

  GetRoutesAvailableFiltersUseCase({
    required this.routesRepository,
    required this.errorHandlerOutputPort,
    required this.routesOutputPort,
  });

  Future<void> call() async {
    final labels = await routesRepository.getRoutesFilterLabels();
    if (labels.wasSuccessful) {
      routesOutputPort.updateRoutesAvailableFilters(labels.result ?? []);
      return;
    }

    errorHandlerOutputPort.setError(labels.failure!);
  }
}
