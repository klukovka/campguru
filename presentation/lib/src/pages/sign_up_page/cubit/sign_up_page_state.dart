part of 'sign_up_page_cubit.dart';

enum SignUpPageStatus {
  initial,
  loading,
  error,
  success,
}

class SignUpPageState extends Equatable {
  final SignUpPageStatus status;
  const SignUpPageState(this.status);

  @override
  List<Object> get props => [status];
}
