import 'package:domain/domain.dart';

class UpdateRouteFavoriteStatusUseCase {
  final RoutesRepository routesRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final RoutesOutputPort routesOutputPort;

  UpdateRouteFavoriteStatusUseCase({
    required this.routesRepository,
    required this.errorHandlerOutputPort,
    required this.routesOutputPort,
  });

  Future<void> call(int routeId, bool isFavorite) async {
    routesOutputPort.updateRouteFavoriteStatus(routeId, isFavorite);

    final response = isFavorite
        ? await routesRepository.addRouteToFavorites(routeId)
        : await routesRepository.removeRouteFromFavorites(routeId);

    if (response.hasFailed) {
      errorHandlerOutputPort.setError(response.failure!);
      routesOutputPort.updateRouteFavoriteStatus(routeId, !isFavorite);
    }
  }
}
