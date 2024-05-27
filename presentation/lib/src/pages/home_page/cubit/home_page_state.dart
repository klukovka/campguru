part of 'home_page_cubit.dart';

class HomePageState extends Equatable {
  final Uint8List? userAvatar;
  final bool isCompleted;

  const HomePageState({
    this.userAvatar,
    this.isCompleted = true,
  });

  HomePageState copyWith({
    ValueGetter<Uint8List?>? userAvatar,
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
