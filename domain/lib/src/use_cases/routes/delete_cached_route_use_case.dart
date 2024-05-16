import 'package:domain/domain.dart';

class DeleteCachedRouteUseCase {
  final CacheRepository cacheRepository;
  final RoutesOutputPort routesOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  DeleteCachedRouteUseCase({
    required this.cacheRepository,
    required this.routesOutputPort,
    required this.errorHandlerOutputPort,
  });

  Future<void> call(int routeId, String searchQuery) async {
    routesOutputPort.deleteCachedRoute(routeId);

    final result = await cacheRepository.deleteRoute(routeId);

    if (result.hasFailed) {
      errorHandlerOutputPort.setError(result.failure!);
      final routes = cacheRepository.getCachedRoutes(searchQuery: searchQuery);
      routesOutputPort.updateCachedRoutes(routes);
    }
  }
}
