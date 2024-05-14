import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(const HomePageState());

  void updateAvatar(String? avatar) {
    emit(state.copyWith(userAvatar: () => avatar));
  }

  void updateIsCompleted(bool isCompleted) =>
      emit(state.copyWith(isCompleted: isCompleted));
}
