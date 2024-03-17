part of 'route_reviews_page_cubit.dart';

class RouteReviewsPageState extends Equatable {
  final Filter filter;
  final bool isLoading;
  final int totslReviewsAmount;
  final List<Review> reviews;

  const RouteReviewsPageState({
    this.filter = const Filter(),
    this.isLoading = true,
    this.totslReviewsAmount = 0,
    this.reviews = const [],
  });

  bool get isFirstLoading => isLoading && filter.page == 0;

  RouteReviewsPageState copyWith({
    Filter? filter,
    bool? isLoading,
    int? totslReviewsAmount,
    List<Review>? reviews,
  }) {
    return RouteReviewsPageState(
      filter: filter ?? this.filter,
      isLoading: isLoading ?? this.isLoading,
      totslReviewsAmount: totslReviewsAmount ?? this.totslReviewsAmount,
      reviews: reviews ?? this.reviews,
    );
  }

  @override
  List<Object> get props => [filter, isLoading, totslReviewsAmount, reviews];
}
