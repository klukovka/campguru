import 'package:domain/domain.dart';

class SplashPageController {
  final IsAuthorizedUseCase isAuthorizedUseCase;
  final GetAllLocationsUseCase getAllLocationsUseCase;
  final GetAllRoutesUseCase getAllRoutesUseCase;
  final GetLocationsAvailableFiltersUseCase getLocationsAvailableFiltersUseCase;
  final GetRoutesAvailableFiltersUseCase getRoutesAvailableFiltersUseCase;

  SplashPageController({
    required this.isAuthorizedUseCase,
    required this.getAllLocationsUseCase,
    required this.getAllRoutesUseCase,
    required this.getLocationsAvailableFiltersUseCase,
    required this.getRoutesAvailableFiltersUseCase,
  });

  void checkIfAuthorized() => isAuthorizedUseCase();

  void preloadData() {
    getLocationsAvailableFiltersUseCase();
    getRoutesAvailableFiltersUseCase();
    getAllLocationsUseCase(const Filter());
    getAllRoutesUseCase(const Filter());
  }
}
