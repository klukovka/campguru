part of 'edit_profile_page_cubit.dart';

enum EditProfilePageStatus {
  initial,
  loading,
  error,
  success,
}

class EditProfilePageState extends Equatable {
  final EditProfilePageStatus status;
  final User? user;
  const EditProfilePageState({
    this.status = EditProfilePageStatus.initial,
    this.user,
  });

  @override
  List<Object?> get props => [status, user];

  EditProfilePageState copyWith({
    EditProfilePageStatus? status,
    User? user,
  }) {
    return EditProfilePageState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
