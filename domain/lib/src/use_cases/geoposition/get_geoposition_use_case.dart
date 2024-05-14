import 'package:domain/domain.dart';

class GetGeopositionUseCase {
  final GeopositionRepository geopositionRepository;
  final GeopositionOutputPort geopositionOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  GetGeopositionUseCase({
    required this.geopositionRepository,
    required this.geopositionOutputPort,
    required this.errorHandlerOutputPort,
  });

  Future<void> call() async {
    final serviceEnabled = await geopositionRepository.checkServiceEnabled();

    if (serviceEnabled.hasFailed) {
      errorHandlerOutputPort.setError(serviceEnabled.failure!);
      geopositionOutputPort.setGeopositionEnabled(false);
      return;
    }

    final permission = await geopositionRepository.checkServiceEnabled();
    if (serviceEnabled.hasFailed) {
      errorHandlerOutputPort.setError(permission.failure!);
      geopositionOutputPort.setGeopositionEnabled(false);
      return;
    }

    final currentPosition = await geopositionRepository.getCurrentPosition();

    if (currentPosition.hasFailed) {
      errorHandlerOutputPort.setError(currentPosition.failure!);
      geopositionOutputPort.setGeopositionEnabled(false);
      return;
    }

    geopositionOutputPort.updateUserPosition(currentPosition.result!);

    final stream = geopositionRepository.getCurrentPositionStream();

    if (stream.hasFailed) {
      errorHandlerOutputPort.setError(stream.failure!);
      geopositionOutputPort.setGeopositionEnabled(false);
      return;
    }

    geopositionOutputPort.setGeopositionEnabled(true);

    stream.result?.listen(geopositionOutputPort.updateUserPosition);
  }
}
