import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'start_page_state.dart';

class StartPageCubit extends Cubit<StartPageState> {
  StartPageCubit() : super(const StartPageState(StartPageStatus.initial));
  void loginCompleted() => emit(const StartPageState(StartPageStatus.success));

  void loginFailed() => emit(const StartPageState(StartPageStatus.error));

  void startLogin() => emit(const StartPageState(StartPageStatus.loading));
}
