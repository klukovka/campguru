import 'package:domain/domain.dart';

class CreateNewRouteUseCase {
  final RoutesRepository routesRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final RoutesOutputPort routesOutputPort;

  CreateNewRouteUseCase({
    required this.routesRepository,
    required this.errorHandlerOutputPort,
    required this.routesOutputPort,
  });

  Future<void> call(NewRoute newRoute) async {
    routesOutputPort.startRouteCreation();
    final route = await routesRepository.createRoute(newRoute);

    if (route.hasFailed) {
      errorHandlerOutputPort.setError(route.failure!);
      routesOutputPort.stopRouteCreation(hasError: true);
      return;
    }

    routesOutputPort.updateRouteDetails(route.result!);
    routesOutputPort.stopRouteCreation(hasError: false);
  }
}
