import 'package:domain/domain.dart';

class EditProfileUseCase {
  final UsersRepository usersRepository;
  final CurrentUserOutputPort currentUserOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  EditProfileUseCase({
    required this.usersRepository,
    required this.currentUserOutputPort,
    required this.errorHandlerOutputPort,
  });

  Future<void> call(PatchUser patchUser) async {
    currentUserOutputPort.startEditProfile();
    final user = await usersRepository.updateUser(patchUser);
    if (user.hasFailed) {
      errorHandlerOutputPort.setError(user.failure!);
      currentUserOutputPort.editProfileFailed();
      return;
    }

    currentUserOutputPort.setCurrentUser(user.result!);
    currentUserOutputPort.editProfileCompleted();
  }
}
