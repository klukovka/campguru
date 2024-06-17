import 'package:domain/domain.dart';

class GetRoutePreviewUseCase {
  final RoutesRepository routesRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final RoutesOutputPort routesOutputPort;

  GetRoutePreviewUseCase({
    required this.routesRepository,
    required this.errorHandlerOutputPort,
    required this.routesOutputPort,
  });

  Future<void> call(List<int> locations) async {
    routesOutputPort.startPreviewLoading();
    final preview = await routesRepository.getRoutePreview(locations);
    if (preview.hasFailed) {
      errorHandlerOutputPort.setError(preview.failure!);
      routesOutputPort.stopPreviewLoading();
      return;
    }

    routesOutputPort.updateRoutePreview(preview.result!.mapUrl);
  }
}
