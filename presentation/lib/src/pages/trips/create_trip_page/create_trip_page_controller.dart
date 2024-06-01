import 'package:domain/domain.dart';

class CreateTripPageController {
  final GetUserByEmailUseCase getUserByEmailUseCase;
  final RemoveUserFromCreatingTripUseCase removeUserFromCreatingTripUseCase;
  final SetTripRouteUseCase setTripRouteUseCase;

  CreateTripPageController({
    required this.getUserByEmailUseCase,
    required this.removeUserFromCreatingTripUseCase,
    required this.setTripRouteUseCase,
  });

  void getUserByEmail(String email) {
    getUserByEmailUseCase(email);
  }

  void removeUser(User user) {
    removeUserFromCreatingTripUseCase(user);
  }

  void clearRoute() {
    setTripRouteUseCase(null);
  }
}
