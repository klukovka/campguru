part of 'profile_tab_cubit.dart';

class ProfileTabState extends Equatable {
  final User user;
  final String version;

  const ProfileTabState({
    this.user = const User(
      id: -1,
      email: '',
      name: '',
      photo: null,
    ),
    this.version = '',
  });

  @override
  List<Object> get props => [user, version];

  ProfileTabState copyWith({
    User? user,
    String? version,
  }) {
    return ProfileTabState(
      user: user ?? this.user,
      version: version ?? this.version,
    );
  }
}
