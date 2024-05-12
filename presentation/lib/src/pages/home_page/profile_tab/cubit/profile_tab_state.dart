part of 'profile_tab_cubit.dart';

class ProfileTabState extends Equatable {
  final User user;

  const ProfileTabState({
    this.user = const User(
      id: -1,
      email: '',
      name: '',
      photo: null,
    ),
  });

  @override
  List<Object> get props => [user];

  ProfileTabState copyWith({
    User? user,
  }) {
    return ProfileTabState(
      user: user ?? this.user,
    );
  }
}
