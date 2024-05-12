import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_tab_state.dart';

class ProfileTabCubit extends Cubit<ProfileTabState> {
  ProfileTabCubit() : super(const ProfileTabState());

  void updateUser(User user) => emit(state.copyWith(
        user: user,
      ));

  void updateVersion(String version) => emit(state.copyWith(version: version));
}
