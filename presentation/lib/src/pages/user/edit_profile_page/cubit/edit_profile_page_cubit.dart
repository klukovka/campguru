import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_profile_page_state.dart';

class EditProfilePageCubit extends Cubit<EditProfilePageState> {
  EditProfilePageCubit() : super(const EditProfilePageState());
  void editProfileCompleted() =>
      emit(state.copyWith(status: EditProfilePageStatus.success));

  void editProfileFailed() =>
      emit(state.copyWith(status: EditProfilePageStatus.error));

  void startEditProfile() =>
      emit(state.copyWith(status: EditProfilePageStatus.loading));

  void setUser(User user) => emit(state.copyWith(
        status: EditProfilePageStatus.initial,
        user: user,
      ));
}
