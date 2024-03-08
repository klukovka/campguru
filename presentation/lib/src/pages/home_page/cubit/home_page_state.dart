part of 'home_page_cubit.dart';

class HomePageState extends Equatable {
  final String? userAvatar;

  const HomePageState({
    this.userAvatar,
  });

  HomePageState copyWith({
    ValueGetter<String?>? userAvatar,
  }) {
    return HomePageState(
      userAvatar: userAvatar == null ? this.userAvatar : userAvatar(),
    );
  }

  @override
  List<Object?> get props => [userAvatar];
}
