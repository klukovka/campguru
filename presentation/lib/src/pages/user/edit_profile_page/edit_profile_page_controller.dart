import 'package:domain/domain.dart';

class EditProfilePageController {
  final EditProfileUseCase editProfileUseCase;

  EditProfilePageController(this.editProfileUseCase);

  void call(NewUser newUser) {
    editProfileUseCase(newUser);
  }
}
