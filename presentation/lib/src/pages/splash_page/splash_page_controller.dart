import 'package:domain/domain.dart';

class SplashPageController {
  final IsAuthorizedUseCase isAuthorizedUseCase;
  final GetAllLocationsUseCase getAllLocationsUseCase;
  final GetAllRoutesUseCase getAllRoutesUseCase;
  final GetLocationsAvailableFiltersUseCase getLocationsAvailableFiltersUseCase;

  SplashPageController({
    required this.isAuthorizedUseCase,
    required this.getAllLocationsUseCase,
    required this.getAllRoutesUseCase,
    required this.getLocationsAvailableFiltersUseCase,
  });

  void checkIfAuthorized() => isAuthorizedUseCase();

  void preloadData() {
    getLocationsAvailableFiltersUseCase();
    getAllLocationsUseCase(const Filter());
    getAllRoutesUseCase(const Filter());
  }
}
