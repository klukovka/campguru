import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GeopositionUseCasesModule {
  @lazySingleton
  GetGeopositionUseCase getGeopositionUseCase(
    GeopositionRepository geopositionRepository,
    GeopositionOutputPort geopositionOutputPort,
    ErrorHandlerOutputPort errorHandlerOutputPort,
  ) =>
      GetGeopositionUseCase(
        geopositionRepository: geopositionRepository,
        geopositionOutputPort: geopositionOutputPort,
        errorHandlerOutputPort: errorHandlerOutputPort,
      );
}
