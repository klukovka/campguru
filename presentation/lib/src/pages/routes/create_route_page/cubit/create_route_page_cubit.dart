import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_route_page_state.dart';

class CreateRoutePageCubit extends Cubit<CreateRoutePageState> {
  CreateRoutePageCubit() : super(const CreateRoutePageState());

  void startPreviewLoading() => emit(state.copyWith(isPreviewLoading: true));
  void stopPreviewLoading() => emit(state.copyWith(isPreviewLoading: false));
  void updatePreview(String preview) => emit(state.copyWith(
        preview: preview,
        isPreviewLoading: false,
      ));

  void startRouteCreation() => emit(state.copyWith(isSaving: true));
  void stopRouteCreation({
    required bool hasError,
  }) =>
      emit(state.copyWith(
        isSaving: false,
        hasError: hasError,
      ));
}
