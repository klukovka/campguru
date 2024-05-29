import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_trip_page_state.dart';

class CreateTripPageCubit extends Cubit<CreateTripPageState> {
  CreateTripPageCubit() : super(const CreateTripPageState());

  void addUser(User user) => emit(
        state.copyWith(users: {...state.users, user}),
      );

  void removeUser(User user) => emit(state.copyWith(
        users: Set.from(state.users)..remove(user),
      ));

  void clearUsers() => emit(state.copyWith(users: {}));

  void setRoute(Route route) => emit(state.copyWith(route: Nullable(route)));

  void clearRoute() => emit(state.copyWith(route: Nullable()));

  void startLoading() => emit(state.copyWith(isLoading: true));

  void stopLoading() => emit(state.copyWith(isLoading: false));
}
