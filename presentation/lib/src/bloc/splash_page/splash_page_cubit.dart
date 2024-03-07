import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_page_state.dart';

class SplashPageCubit extends Cubit<SplashPageState> {
  SplashPageCubit() : super(SplashPageState.loading);

  void checkIsAuthorized(bool isAuthorized) => emit(
        isAuthorized
            ? SplashPageState.authorized
            : SplashPageState.nonAuthorized,
      );
}
