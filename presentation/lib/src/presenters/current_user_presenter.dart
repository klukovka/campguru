import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class CurrentUserPresenter implements CurrentUserOutputPort {
  final SplashPageCubit splashPageCubit;
  final HomePageCubit homePageCubit;
  final ProfileTabCubit profileTabCubit;
  final SignUpPageCubit signUpPageCubit;
  final StartPageCubit startPageCubit;

  CurrentUserPresenter({
    required this.splashPageCubit,
    required this.homePageCubit,
    required this.profileTabCubit,
    required this.signUpPageCubit,
    required this.startPageCubit,
  });
  @override
  void setCurrentUser(User? user) {
    splashPageCubit.checkIsAuthorized(user != null);
    homePageCubit.updateAvatar(user?.photo);
    if (user != null) {
      profileTabCubit.updateUser(user);
    }
  }

  @override
  void signUpCompleted() {
    signUpPageCubit.signUpCompleted();
  }

  @override
  void signUpFailed() {
    signUpPageCubit.signUpFailed();
  }

  @override
  void startSignUp() {
    signUpPageCubit.startSignUp();
  }

  @override
  void loginCompleted() {
    startPageCubit.loginCompleted();
  }

  @override
  void loginFailed() {
    startPageCubit.loginFailed();
  }

  @override
  void startLogin() {
    startPageCubit.startLogin();
  }
}
