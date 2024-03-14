import 'package:domain/domain.dart';

class SplashPageController {
  final IsAuthorizedUseCase isAuthorizedUseCase;
  final GetAllLocationsUseCase getAllLocationsUseCase;
  final GetAllRoutesUseCase getAllRoutesUseCase;

  SplashPageController({
    required this.isAuthorizedUseCase,
    required this.getAllLocationsUseCase,
    required this.getAllRoutesUseCase,
  });

  void checkIfAuthorized() => isAuthorizedUseCase();

  void preloadData() {
    getAllLocationsUseCase(const Filter());
    getAllRoutesUseCase(const Filter());
  }
}
