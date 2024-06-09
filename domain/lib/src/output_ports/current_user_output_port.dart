import 'package:domain/domain.dart';

abstract class CurrentUserOutputPort {
  void setCurrentUser(User? user);
  void startSignUp();
  void signUpFailed();
  void signUpCompleted();

  void startLogin();
  void loginFailed();
  void loginCompleted();

  void startEditProfile();
  void editProfileFailed();
  void editProfileCompleted();

  void startResetPassword();
  void resetPasswordFailed();
  void resetPasswordCompleted();
}
