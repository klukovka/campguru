part of 'app_control_cubit.dart';

class AppControlState extends Equatable {
  final Failure? failue;

  const AppControlState({
    this.failue,
  });

  AppControlState copyWith({
    ValueGetter<Failure?>? failue,
  }) {
    return AppControlState(
      failue: failue != null ? failue() : this.failue,
    );
  }

  @override
  List<Object?> get props => [failue];
}
