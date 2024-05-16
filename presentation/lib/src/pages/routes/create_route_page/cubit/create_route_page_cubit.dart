import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_route_page_state.dart';

class CreateRoutePageCubit extends Cubit<CreateRoutePageState> {
  CreateRoutePageCubit() : super(const CreateRoutePageState());

  void resetState() => emit(const CreateRoutePageState());
  void startPreviewLoading() => emit(state.copyWith(isPreviewLoading: true));
  void stopPreviewLoading() => emit(state.copyWith(isPreviewLoading: false));
  void updatePreview(String preview) => emit(state.copyWith(
        preview: Nullable(preview),
        isPreviewLoading: false,
      ));

  void startRouteCreation() => emit(state.copyWith(
        isSaving: true,
        routeId: Nullable(),
      ));

  void stopRouteCreation({
    required bool hasError,
    int? routeId,
  }) =>
      emit(state.copyWith(
        isSaving: false,
        hasError: hasError,
        routeId: Nullable(routeId),
        preview: hasError ? Nullable() : null,
      ));
}
