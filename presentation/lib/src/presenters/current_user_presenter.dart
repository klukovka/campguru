import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class CurrentUserPresenter implements CurrentUserOutputPort {
  final SplashPageCubit splashPageCubit;
  final HomePageCubit homePageCubit;
  final ProfileTabCubit profileTabCubit;
  final SignUpPageCubit signUpPageCubit;
  final StartPageCubit startPageCubit;
  final EditProfilePageCubit editProfilePageCubit;
  final LocationsFiltersPageCubit locationsFiltersPageCubit;
  final RoutesFiltersPageCubit routesFiltersPageCubit;
  final SubscriptionPageCubit subscriptionPageCubit;
  final ResetPasswordPageCubit resetPasswordPageCubit;

  CurrentUserPresenter({
    required this.splashPageCubit,
    required this.homePageCubit,
    required this.profileTabCubit,
    required this.signUpPageCubit,
    required this.startPageCubit,
    required this.editProfilePageCubit,
    required this.locationsFiltersPageCubit,
    required this.routesFiltersPageCubit,
    required this.subscriptionPageCubit,
    required this.resetPasswordPageCubit,
  });
  @override
  void setCurrentUser(User? user) {
    splashPageCubit.checkIsAuthorized(user != null);
    homePageCubit.updateAvatar(user?.photo);
    if (user != null) {
      profileTabCubit.updateUser(user);
      editProfilePageCubit.setUser(user);
      locationsFiltersPageCubit.updatePremiumStatus(user.hasPremium);
      routesFiltersPageCubit.updatePremiumStatus(user.hasPremium);
      subscriptionPageCubit.updateUser(user);
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

  @override
  void editProfileCompleted() {
    editProfilePageCubit.editProfileCompleted();
  }

  @override
  void editProfileFailed() {
    editProfilePageCubit.editProfileFailed();
  }

  @override
  void startEditProfile() {
    editProfilePageCubit.startEditProfile();
  }

  @override
  void resetPasswordCompleted() {
    resetPasswordPageCubit.resetPasswordCompleted();
  }

  @override
  void resetPasswordFailed() {
    resetPasswordPageCubit.resetPasswordFailed();
  }

  @override
  void startResetPassword() {
    resetPasswordPageCubit.startResetPassword();
  }
}
