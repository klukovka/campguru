import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class CurrentUserPresenter implements CurrentUserOutputPort {
  final SplashPageCubit splashPageCubit;
  final HomePageCubit homePageCubit;
  final ProfileTabCubit profileTabCubit;

  CurrentUserPresenter({
    required this.splashPageCubit,
    required this.homePageCubit,
    required this.profileTabCubit,
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
    // TODO: implement signUpCompleted
  }

  @override
  void signUpFailed() {
    // TODO: implement signUpFailed
  }

  @override
  void startSignUp() {
    // TODO: implement startSignUp
  }
}
