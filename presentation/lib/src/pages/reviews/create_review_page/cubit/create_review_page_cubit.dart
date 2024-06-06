import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_review_page_state.dart';

class CreateReviewPageCubit extends Cubit<CreateReviewPageState> {
  CreateReviewPageCubit() : super(const CreateReviewPageState());

  void startLoading() => emit(state.copyWith(isLoading: true));

  void completedWithError() => emit(state.copyWith(
        isLoading: false,
        hasError: true,
      ));

  void completedSuccessfully() => emit(state.copyWith(
        isLoading: false,
        hasError: false,
      ));
}
