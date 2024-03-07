import 'package:domain/domain.dart';

abstract class AuthOutputPort {
  void setCurrentUser(User? user);
}
