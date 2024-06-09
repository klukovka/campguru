part of 'change_password_page_cubit.dart';

enum ChangePasswordPageStatus {
  initial,
  loading,
  error,
  success,
}

class ChangePasswordPageState extends Equatable {
  final ChangePasswordPageStatus status;
  const ChangePasswordPageState(this.status);

  @override
  List<Object> get props => [status];
}
