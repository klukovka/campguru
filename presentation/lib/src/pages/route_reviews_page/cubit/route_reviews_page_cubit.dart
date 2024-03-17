import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'route_reviews_page_state.dart';

class RouteReviewsPageCubit extends Cubit<RouteReviewsPageState> {
  RouteReviewsPageCubit() : super(const RouteReviewsPageState());

  void setFilter(Filter filter) => emit(state.copyWith(
        filter: filter,
        isLoading: true,
      ));

  void setReviews(List<Review> reviews, {int? amount}) => emit(state.copyWith(
        reviews: reviews,
        isLoading: false,
        totslReviewsAmount: amount,
      ));

  void appendReview(List<Review> reviews) => emit(state.copyWith(
        reviews: [...state.reviews, ...reviews],
        isLoading: false,
      ));

  void stopLoading() => emit(state.copyWith(isLoading: false));
}
