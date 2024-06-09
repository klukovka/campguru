part of 'reset_password_page_cubit.dart';

enum ResetPasswordPageStatus {
  initial,
  loading,
  error,
  success,
}

class ResetPasswordPageState extends Equatable {
  final ResetPasswordPageStatus status;
  const ResetPasswordPageState(this.status);

  @override
  List<Object> get props => [status];
}
