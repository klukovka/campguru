import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_control_state.dart';

class AppControlCubit extends Cubit<AppControlState> {
  AppControlCubit() : super(const AppControlState());

  void setFailure(Failure failure) => emit(state.copyWith(
        failue: () => failure,
      ));

  void resetFailure() => emit(state.copyWith(
        failue: () => null,
      ));
}
