import 'package:domain/domain.dart';

class GetMyOwnRoutesUseCase {
  final RoutesRepository routesRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final RoutesOutputPort routesOutputPort;

  GetMyOwnRoutesUseCase({
    required this.routesRepository,
    required this.errorHandlerOutputPort,
    required this.routesOutputPort,
  });

  Future<void> call(Filter filter) async {
    routesOutputPort.setMyOwnRoutesFilter(filter);
    final routes = await routesRepository.getMyOwnRoutes(filter);

    if (routes.wasSuccessful) {
      routesOutputPort.updateMyOwnRoutes(
        routes.result!.values,
        routes.result!.fullCount,
      );
      return;
    }

    errorHandlerOutputPort.setError(routes.failure!);
    routesOutputPort.stopMyOwnRoutesLoading();
  }
}
