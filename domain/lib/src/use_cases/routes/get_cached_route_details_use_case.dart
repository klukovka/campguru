import 'package:domain/domain.dart';

class GetCachedRouteDetailsUseCase {
  final CacheRepository cacheRepository;
  final RoutesOutputPort routesOutputPort;

  GetCachedRouteDetailsUseCase({
    required this.cacheRepository,
    required this.routesOutputPort,
  });

  Future<void> call(int routeId) async {
    final routeDetails = cacheRepository.getRoute(routeId);
    routesOutputPort.updateCachedRouteDetails(routeDetails);
  }
}
