import 'package:domain/domain.dart';

class SplashPageController {
  final IsAuthorizedUseCase isAuthorizedUseCase;
  final GetAllLocationsUseCase getAllLocationsUseCase;
  final GetAllRoutesUseCase getAllRoutesUseCase;
  final GetLocationsAvailableFiltersUseCase getLocationsAvailableFiltersUseCase;
  final GetRoutesAvailableFiltersUseCase getRoutesAvailableFiltersUseCase;
  final GetAppVersion getAppVersion;
  final GetTripsUseCase getAllTripsUseCase;
  final GetFavoriteLocationsUseCase getFavoriteLocationsUseCase;
  final GetFavoriteRoutesUseCase getFavoriteRoutesUseCase;
  final GetMyOwnRoutesUseCase getMyOwnRoutesUseCase;

  SplashPageController({
    required this.isAuthorizedUseCase,
    required this.getAllLocationsUseCase,
    required this.getAllRoutesUseCase,
    required this.getLocationsAvailableFiltersUseCase,
    required this.getRoutesAvailableFiltersUseCase,
    required this.getAppVersion,
    required this.getAllTripsUseCase,
    required this.getFavoriteLocationsUseCase,
    required this.getFavoriteRoutesUseCase,
    required this.getMyOwnRoutesUseCase,
  });

  void checkIfAuthorized() => isAuthorizedUseCase();

  void preloadData() {
    getLocationsAvailableFiltersUseCase();
    getRoutesAvailableFiltersUseCase();
    getAllLocationsUseCase(const Filter());
    getAllRoutesUseCase(const Filter());
    getAllTripsUseCase(const Filter());
    getFavoriteLocationsUseCase(const Filter());
    getFavoriteRoutesUseCase(const Filter());
    getMyOwnRoutesUseCase(const Filter());
    getAppVersion();
  }
}
