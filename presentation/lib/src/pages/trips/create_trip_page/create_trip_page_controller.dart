import 'package:domain/domain.dart';

class CreateTripPageController {
  final GetUserByEmailUseCase getUserByEmailUseCase;
  final RemoveUserFromCreatingTripUseCase removeUserFromCreatingTripUseCase;
  final SetTripRouteUseCase setTripRouteUseCase;
  final CreateTripUseCase createTripUseCase;

  CreateTripPageController({
    required this.getUserByEmailUseCase,
    required this.removeUserFromCreatingTripUseCase,
    required this.setTripRouteUseCase,
    required this.createTripUseCase,
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

  void createTrip(NewTrip newTrip) {
    createTripUseCase(newTrip);
  }
}
