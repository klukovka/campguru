part of 'create_route_page_cubit.dart';

class CreateRoutePageState extends Equatable {
  final bool isSaving;
  final bool isPreviewLoading;
  final bool hasError;
  final String? preview;
  final int? routeId;

  const CreateRoutePageState({
    this.isSaving = false,
    this.isPreviewLoading = false,
    this.hasError = false,
    this.preview,
    this.routeId,
  });

  CreateRoutePageState copyWith({
    bool? isSaving,
    bool? isPreviewLoading,
    Nullable<String>? preview,
    bool? hasError,
    Nullable<int>? routeId,
  }) {
    return CreateRoutePageState(
      isSaving: isSaving ?? this.isSaving,
      isPreviewLoading: isPreviewLoading ?? this.isPreviewLoading,
      preview: preview != null ? preview.value : this.preview,
      hasError: hasError ?? this.hasError,
      routeId: routeId != null ? routeId.value : this.routeId,
    );
  }

  @override
  List<Object?> get props => [
        isSaving,
        isPreviewLoading,
        preview,
        hasError,
        routeId,
      ];
}
