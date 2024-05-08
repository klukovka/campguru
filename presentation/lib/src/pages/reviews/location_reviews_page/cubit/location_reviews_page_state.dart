part of 'location_reviews_page_cubit.dart';

class LocationReviewsPageState extends Equatable {
  final Filter filter;
  final bool isLoading;
  final int totslReviewsAmount;
  final List<Review> reviews;

  const LocationReviewsPageState({
    this.filter = const Filter(),
    this.isLoading = true,
    this.totslReviewsAmount = 0,
    this.reviews = const [],
  });

  bool get isFirstLoading => isLoading && filter.page == 0;

  LocationReviewsPageState copyWith({
    Filter? filter,
    bool? isLoading,
    int? totslReviewsAmount,
    List<Review>? reviews,
  }) {
    return LocationReviewsPageState(
      filter: filter ?? this.filter,
      isLoading: isLoading ?? this.isLoading,
      totslReviewsAmount: totslReviewsAmount ?? this.totslReviewsAmount,
      reviews: reviews ?? this.reviews,
    );
  }

  @override
  List<Object> get props => [filter, isLoading, totslReviewsAmount, reviews];
}
