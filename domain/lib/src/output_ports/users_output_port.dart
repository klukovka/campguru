import 'package:domain/src/entities/users/user.dart';

abstract class UsersOutputPort {
  void addUserToList(User user);
  void removeUser(User user);
  void clearUsers();
}
