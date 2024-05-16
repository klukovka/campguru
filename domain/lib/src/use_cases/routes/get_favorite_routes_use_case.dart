import 'package:domain/domain.dart';

class GetFavoriteRoutesUseCase {
  final RoutesRepository routesRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final RoutesOutputPort routesOutputPort;

  GetFavoriteRoutesUseCase({
    required this.routesRepository,
    required this.errorHandlerOutputPort,
    required this.routesOutputPort,
  });

  Future<void> call(Filter filter) async {
    routesOutputPort.setFavoriteRoutesFilter(filter);
    final routes = await routesRepository.getFavoriteRoutes(filter);

    if (routes.wasSuccessful) {
      routesOutputPort.updateFavoriteRoutes(
        routes.result!.values,
        routes.result!.fullCount,
      );
      return;
    }

    errorHandlerOutputPort.setError(routes.failure!);
    routesOutputPort.stopFavoriteRoutesLoading();
  }
}
