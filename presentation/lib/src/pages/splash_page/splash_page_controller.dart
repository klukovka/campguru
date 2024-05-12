import 'package:domain/domain.dart';

class SplashPageController {
  final IsAuthorizedUseCase isAuthorizedUseCase;
  final GetAllLocationsUseCase getAllLocationsUseCase;
  final GetAllRoutesUseCase getAllRoutesUseCase;
  final GetLocationsAvailableFiltersUseCase getLocationsAvailableFiltersUseCase;
  final GetRoutesAvailableFiltersUseCase getRoutesAvailableFiltersUseCase;
  final GetAppVersion getAppVersion;

  SplashPageController({
    required this.isAuthorizedUseCase,
    required this.getAllLocationsUseCase,
    required this.getAllRoutesUseCase,
    required this.getLocationsAvailableFiltersUseCase,
    required this.getRoutesAvailableFiltersUseCase,
    required this.getAppVersion,
  });

  void checkIfAuthorized() => isAuthorizedUseCase();

  void preloadData() {
    getLocationsAvailableFiltersUseCase();
    getRoutesAvailableFiltersUseCase();
    getAllLocationsUseCase(const Filter());
    getAllRoutesUseCase(const Filter());
    getAppVersion();
  }
}
