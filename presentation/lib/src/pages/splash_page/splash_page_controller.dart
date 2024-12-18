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
  final GetCachedRoutesUseCase getCachedRoutesUseCase;
  final GetInitialSettingsUseCase getInitialSettingsUseCase;
  final GetAvailableSubscriptionsUseCase getAvailableSubscriptionsUseCase;

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
    required this.getCachedRoutesUseCase,
    required this.getInitialSettingsUseCase,
    required this.getAvailableSubscriptionsUseCase,
  });

  void getSettings() => getInitialSettingsUseCase();

  void checkIfAuthorized() => isAuthorizedUseCase();

  void preloadData() {
    getAvailableSubscriptionsUseCase();
    getLocationsAvailableFiltersUseCase();
    getRoutesAvailableFiltersUseCase();
    getAllLocationsUseCase(const Filter());
    getAllRoutesUseCase(const Filter());
    getAllTripsUseCase(const Filter());
    getFavoriteLocationsUseCase(const Filter());
    getFavoriteRoutesUseCase(const Filter());
    getMyOwnRoutesUseCase(const Filter());
    getCachedRoutesUseCase();
    getAppVersion();
  }
}
