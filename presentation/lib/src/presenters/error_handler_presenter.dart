import 'dart:developer';

import 'package:domain/domain.dart';

class ErrorHandlerPresenter implements ErrorHandlerOutputPort {
  @override
  void setError(Failure failure) {
    log(failure.toString());
  }
}
