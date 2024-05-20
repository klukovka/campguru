import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class CurrentUserPresenter implements CurrentUserOutputPort {
  final SplashPageCubit splashPageCubit;
  final HomePageCubit homePageCubit;
  final ProfileTabCubit profileTabCubit;
  final SignUpPageCubit signUpPageCubit;

  CurrentUserPresenter({
    required this.splashPageCubit,
    required this.homePageCubit,
    required this.profileTabCubit,
    required this.signUpPageCubit,
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
}
