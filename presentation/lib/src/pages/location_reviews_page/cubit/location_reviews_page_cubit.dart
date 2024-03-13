import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_reviews_page_state.dart';

class LocationReviewsPageCubit extends Cubit<LocationReviewsPageState> {
  LocationReviewsPageCubit() : super(const LocationReviewsPageState());

  void setFilter(Filter filter) => emit(state.copyWith(
        filter: filter,
        isLoading: true,
      ));

  void setLocations(List<Review> reviews, {int? amount}) => emit(state.copyWith(
        reviews: reviews,
        isLoading: false,
        totslReviewsAmount: amount,
      ));

  void appendLocations(List<Review> reviews) => emit(state.copyWith(
        reviews: [...state.reviews, ...reviews],
        isLoading: false,
      ));

  void stopLoading() => emit(state.copyWith(isLoading: false));
}
