import 'package:domain/domain.dart';

class SplashPageController {
  final IsAuthorizedUseCase isAuthorizedUseCase;
  final GetAllLocationsUseCase getAllLocationsUseCase;

  SplashPageController({
    required this.isAuthorizedUseCase,
    required this.getAllLocationsUseCase,
  });

  void checkIfAuthorized() => isAuthorizedUseCase();

  void preloadData() {
    getAllLocationsUseCase(const Filter());
  }
}
