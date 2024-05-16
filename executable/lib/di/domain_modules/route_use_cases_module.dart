import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RouteUseCasesModule {
  @lazySingleton
  GetAllRoutesUseCase getAllRoutesUseCase(
    RoutesRepository routesRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    RoutesOutputPort routesOutputPort,
  ) =>
      GetAllRoutesUseCase(
        routesRepository: routesRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        routesOutputPort: routesOutputPort,
      );

  @lazySingleton
  UpdateRouteFavoriteStatusUseCase getUpdateRouteFavoriteStatusUseCase(
    RoutesRepository routesRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    RoutesOutputPort routesOutputPort,
  ) =>
      UpdateRouteFavoriteStatusUseCase(
        routesRepository: routesRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        routesOutputPort: routesOutputPort,
      );

  @lazySingleton
  GetRouteDetailsUseCase getRouteDetailsUseCase(
    RoutesRepository routesRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    RoutesOutputPort routesOutputPort,
  ) =>
      GetRouteDetailsUseCase(
        routesRepository: routesRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        routesOutputPort: routesOutputPort,
      );

  @lazySingleton
  GetRoutesAvailableFiltersUseCase getRoutesAvailableFiltersUseCase(
    RoutesRepository routesRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    RoutesOutputPort routesOutputPort,
  ) =>
      GetRoutesAvailableFiltersUseCase(
        routesRepository: routesRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        routesOutputPort: routesOutputPort,
      );

  @lazySingleton
  CacheRouteUseCase cacheRouteUseCase(
    ErrorHandlerOutputPort errorHandlerOutputPort,
    RoutesOutputPort routesOutputPort,
    CacheRepository cacheRepository,
    UsersRepository usersRepository,
  ) =>
      CacheRouteUseCase(
        cacheRepository: cacheRepository,
        usersRepository: usersRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        routesOutputPort: routesOutputPort,
      );

  @lazySingleton
  CreateNewRouteUseCase getCreateNewRouteUseCase(
    RoutesRepository routesRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    RoutesOutputPort routesOutputPort,
  ) =>
      CreateNewRouteUseCase(
        routesRepository: routesRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        routesOutputPort: routesOutputPort,
      );

  @lazySingleton
  GetRoutePreviewUseCase getGetRoutePreviewUseCase(
    RoutesRepository routesRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    RoutesOutputPort routesOutputPort,
  ) =>
      GetRoutePreviewUseCase(
        routesRepository: routesRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        routesOutputPort: routesOutputPort,
      );

  @lazySingleton
  GetFavoriteRoutesUseCase getFavoriteRoutesUseCase(
    RoutesRepository routesRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    RoutesOutputPort routesOutputPort,
  ) =>
      GetFavoriteRoutesUseCase(
        routesRepository: routesRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        routesOutputPort: routesOutputPort,
      );

  @lazySingleton
  GetMyOwnRoutesUseCase getMyOwnRoutesUseCase(
    RoutesRepository routesRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    RoutesOutputPort routesOutputPort,
  ) =>
      GetMyOwnRoutesUseCase(
        routesRepository: routesRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        routesOutputPort: routesOutputPort,
      );

  @lazySingleton
  GetCachedRoutesUseCase getCachedRoutesUseCase(
    CacheRepository cacheRepository,
    RoutesOutputPort routesOutputPort,
  ) =>
      GetCachedRoutesUseCase(
        cacheRepository: cacheRepository,
        routesOutputPort: routesOutputPort,
      );

  @lazySingleton
  DeleteCachedRouteUseCase deleteCachedRouteUseCase(
    CacheRepository cacheRepository,
    RoutesOutputPort routesOutputPort,
    ErrorHandlerOutputPort errorHandlerOutputPort,
  ) =>
      DeleteCachedRouteUseCase(
        cacheRepository: cacheRepository,
        routesOutputPort: routesOutputPort,
        errorHandlerOutputPort: errorHandlerOutputPort,
      );
}
