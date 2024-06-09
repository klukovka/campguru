import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_password_page_state.dart';

class ResetPasswordPageCubit extends Cubit<ResetPasswordPageState> {
  ResetPasswordPageCubit()
      : super(const ResetPasswordPageState(ResetPasswordPageStatus.initial));
  void resetPasswordCompleted() =>
      emit(const ResetPasswordPageState(ResetPasswordPageStatus.success));

  void resetPasswordFailed() =>
      emit(const ResetPasswordPageState(ResetPasswordPageStatus.error));

  void startResetPassword() =>
      emit(const ResetPasswordPageState(ResetPasswordPageStatus.loading));
}
