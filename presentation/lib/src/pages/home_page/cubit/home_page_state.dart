part of 'home_page_cubit.dart';

class HomePageState extends Equatable {
  final String? userAvatar;
  final bool isCompleted;

  const HomePageState({
    this.userAvatar,
    this.isCompleted = true,
  });

  HomePageState copyWith({
    ValueGetter<String?>? userAvatar,
    bool? isCompleted,
  }) {
    return HomePageState(
      userAvatar: userAvatar == null ? this.userAvatar : userAvatar(),
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [userAvatar, isCompleted];
}
