import 'package:domain/domain.dart';

class GetRouteDetailsUseCase {
  final RoutesRepository routesRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final RoutesOutputPort routesOutputPort;

  GetRouteDetailsUseCase({
    required this.routesRepository,
    required this.errorHandlerOutputPort,
    required this.routesOutputPort,
  });

  Future<void> call(int routeId) async {
    routesOutputPort.startRouteDetailsLoading();
    final routeDetails = await routesRepository.getRouteDetails(
      routeId,
    );

    if (routeDetails.wasSuccessful) {
      routesOutputPort.updateRouteDetails(routeDetails.result!);
      return;
    }

    errorHandlerOutputPort.setError(routeDetails.failure!);
    routesOutputPort.updateRouteDetailsBriefly(routeId);
  }
}
