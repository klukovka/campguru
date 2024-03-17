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
}
