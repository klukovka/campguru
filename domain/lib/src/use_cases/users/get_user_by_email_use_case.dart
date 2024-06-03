import 'package:domain/domain.dart';

class GetUserByEmailUseCase {
  final UsersRepository usersRepository;
  final UsersOutputPort usersOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  GetUserByEmailUseCase({
    required this.usersRepository,
    required this.usersOutputPort,
    required this.errorHandlerOutputPort,
  });

  Future<void> call(String email) async {
    final result = await usersRepository.getUserByEmail(email);

    if (result.hasFailed) {
      errorHandlerOutputPort.setError(result.failure!);
      return;
    }

    usersOutputPort.addUserToList(result.result!);
  }
}
