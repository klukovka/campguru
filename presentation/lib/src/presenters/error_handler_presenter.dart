import 'package:domain/domain.dart';
import 'package:presentation/src/bloc.dart';

class ErrorHandlerPresenter implements ErrorHandlerOutputPort {
  final AppControlCubit appControlCubit;

  ErrorHandlerPresenter({required this.appControlCubit});

  @override
  void setError(Failure failure) {
    appControlCubit
      ..setFailure(failure)
      ..resetFailure();
  }
}
