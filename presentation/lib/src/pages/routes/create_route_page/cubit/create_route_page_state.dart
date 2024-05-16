part of 'create_route_page_cubit.dart';

class CreateRoutePageState extends Equatable {
  final bool isSaving;
  final bool isPreviewLoading;
  final bool hasError;
  final String? preview;

  const CreateRoutePageState({
    this.isSaving = false,
    this.isPreviewLoading = false,
    this.hasError = false,
    this.preview,
  });

  CreateRoutePageState copyWith({
    bool? isSaving,
    bool? isPreviewLoading,
    String? preview,
    bool? hasError,
  }) {
    return CreateRoutePageState(
      isSaving: isSaving ?? this.isSaving,
      isPreviewLoading: isPreviewLoading ?? this.isPreviewLoading,
      preview: preview ?? this.preview,
      hasError: hasError ?? this.hasError,
    );
  }

  @override
  List<Object?> get props => [
        isSaving,
        isPreviewLoading,
        preview,
        hasError,
      ];
}
