import 'dart:developer';

import 'package:domain/domain.dart';

class CurrentUserPresenter implements CurrentUserOutputPort {
  @override
  void setCurrentUser(User? user) {
    //TODO: Update user over the app
    log(user.toString());
  }
}
