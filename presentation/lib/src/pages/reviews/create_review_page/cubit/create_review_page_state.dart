part of 'create_review_page_cubit.dart';

class CreateReviewPageState extends Equatable {
  final bool isLoading;
  final bool hasError;
  const CreateReviewPageState({
    this.hasError = false,
    this.isLoading = false,
  });

  @override
  List<Object> get props => [isLoading, hasError];

  CreateReviewPageState copyWith({
    bool? isLoading,
    bool? hasError,
  }) {
    return CreateReviewPageState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
