import 'package:domain/domain.dart';

abstract class CurrentUserOutputPort {
  void setCurrentUser(User? user);
  void startSignUp();
  void signUpFailed();
  void signUpCompleted();
}
