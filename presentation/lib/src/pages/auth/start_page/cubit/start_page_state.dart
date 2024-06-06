part of 'start_page_cubit.dart';

enum StartPageStatus {
  initial,
  loading,
  error,
  success,
}

class StartPageState extends Equatable {
  final StartPageStatus status;
  const StartPageState(this.status);

  @override
  List<Object> get props => [status];
}
