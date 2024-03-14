import 'package:domain/domain.dart';

class GetAllRoutesUseCase {
  final RoutesRepository routesRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final RoutesOutputPort routesOutputPort;

  GetAllRoutesUseCase({
    required this.routesRepository,
    required this.errorHandlerOutputPort,
    required this.routesOutputPort,
  });

  Future<void> call(Filter filter) async {
    routesOutputPort.setAllRoutesFilter(filter);
    final routes = await routesRepository.getAllRoutes(filter);

    if (routes.wasSuccessful) {
      routesOutputPort.updateAllRoutes(
        routes.result!.values,
        routes.result!.fullCount,
      );
      return;
    }

    errorHandlerOutputPort.setError(routes.failure!);
    routesOutputPort.stopAllRoutesLoading();
  }
}
