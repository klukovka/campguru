import 'package:domain/domain.dart';

class GetCachedRouteDetailsUseCase {
  final CacheRepository cacheRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final RoutesOutputPort routesOutputPort;

  GetCachedRouteDetailsUseCase({
    required this.cacheRepository,
    required this.errorHandlerOutputPort,
    required this.routesOutputPort,
  });

  Future<void> call(int routeId) async {
    final routeDetails = await cacheRepository.getRoute(
      routeId,
    );

    if (routeDetails.wasSuccessful) {
      routesOutputPort.updateCachedRouteDetails(routeDetails.result!);
      return;
    }

    errorHandlerOutputPort.setError(routeDetails.failure!);
  }
}
