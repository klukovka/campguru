import 'package:domain/domain.dart';

class CreateTripPageController {
  final GetUserByEmailUseCase getUserByEmailUseCase;
  final RemoveUserFromCreatingTripUseCase removeUserFromCreatingTripUseCase;

  CreateTripPageController({
    required this.getUserByEmailUseCase,
    required this.removeUserFromCreatingTripUseCase,
  });

  void getUserByEmail(String email) {
    getUserByEmailUseCase(email);
  }

  void removeUser(User user) {
    removeUserFromCreatingTripUseCase(user);
  }
}
