import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_page_state.dart';

class SignUpPageCubit extends Cubit<SignUpPageState> {
  SignUpPageCubit() : super(const SignUpPageState(SignUpPageStatus.initial));
  void signUpCompleted() =>
      emit(const SignUpPageState(SignUpPageStatus.success));

  void signUpFailed() => emit(const SignUpPageState(SignUpPageStatus.error));

  void startSignUp() => emit(const SignUpPageState(SignUpPageStatus.loading));
}
