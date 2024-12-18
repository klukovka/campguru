import 'package:domain/domain.dart';

class CacheRouteUseCase {
  final CacheRepository cacheRepository;
  final UsersRepository usersRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final RoutesOutputPort routesOutputPort;

  CacheRouteUseCase({
    required this.cacheRepository,
    required this.usersRepository,
    required this.errorHandlerOutputPort,
    required this.routesOutputPort,
  });

  Future<void> call(Route route) async {
    routesOutputPort.updateCacheProgress(cacheProgress: 0, isCompleted: false);

    final user = await usersRepository.getCurrentUser();

    if (user.hasFailed) {
      errorHandlerOutputPort.setError(user.failure!);
      routesOutputPort.updateCacheProgress(
        cacheProgress: 0,
        isCompleted: true,
      );
      return;
    }

    final cachedRoutesAmount = cacheRepository.getCachedRoutes().length;

    if (!user.result!.hasPremium && cachedRoutesAmount >= 3) {
      errorHandlerOutputPort.setError(ApplicationFailure(
        type: ApplicationErrorType.toSaveMoreRoutesBuyPremium,
      ));
      routesOutputPort.updateCacheProgress(
        cacheProgress: 0,
        isCompleted: true,
      );
      return;
    }

    var downloadStream = cacheRepository.saveRoute(route);

    downloadStream.listen((event) {
      routesOutputPort.updateCacheProgress(
        cacheProgress: event.$1,
        isCompleted: event.$2,
      );
    });
  }
}
