import 'dart:developer';

import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class CurrentUserPresenter implements CurrentUserOutputPort {
  final SplashPageCubit splashPageCubit;

  CurrentUserPresenter({
    required this.splashPageCubit,
  });
  @override
  void setCurrentUser(User? user) {
    //TODO: Update user over the app
    splashPageCubit.checkIsAuthorized(user != null);
    log(user.toString());
  }
}
