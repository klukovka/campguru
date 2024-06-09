import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_password_page_state.dart';

class ChangePasswordPageCubit extends Cubit<ChangePasswordPageState> {
  ChangePasswordPageCubit()
      : super(const ChangePasswordPageState(ChangePasswordPageStatus.initial));
  void changePasswordCompleted() =>
      emit(const ChangePasswordPageState(ChangePasswordPageStatus.success));

  void changePasswordFailed() =>
      emit(const ChangePasswordPageState(ChangePasswordPageStatus.error));

  void startChangePassword() =>
      emit(const ChangePasswordPageState(ChangePasswordPageStatus.loading));
}
