import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class UsersPresenter implements UsersOutputPort {
  final CreateTripPageCubit createTripPageCubit;

  UsersPresenter({required this.createTripPageCubit});

  @override
  void addUserToList(User user) {
    createTripPageCubit.addUser(user);
  }

  @override
  void removeUser(User user) {
    createTripPageCubit.removeUser(user);
  }
}
