import 'package:domain/domain.dart';

class CreateRoutePageController {
  final GetRoutePreviewUseCase getRoutePreviewUseCase;
  final CreateNewRouteUseCase createNewRouteUseCase;

  CreateRoutePageController({
    required this.getRoutePreviewUseCase,
    required this.createNewRouteUseCase,
  });

  void getPreview(List<Location>? locations) {
    getRoutePreviewUseCase(locations?.map((e) => e.id).toList() ?? []);
  }

  void createRoute(NewRoute newRoute) {
    createNewRouteUseCase(newRoute);
  }
}
