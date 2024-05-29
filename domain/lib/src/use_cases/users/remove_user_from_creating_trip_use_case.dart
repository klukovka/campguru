import 'package:domain/domain.dart';

class RemoveUserFromCreatingTripUseCase {
  final UsersOutputPort usersOutputPort;

  RemoveUserFromCreatingTripUseCase({required this.usersOutputPort});

  void call(User user) {
    usersOutputPort.removeUser(user);
  }
}
