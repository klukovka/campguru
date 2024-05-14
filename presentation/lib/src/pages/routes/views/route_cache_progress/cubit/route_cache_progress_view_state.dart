part of 'route_cache_progress_view_cubit.dart';

class RouteCacheProgressViewState extends Equatable {
  final double cacheProgress;

  const RouteCacheProgressViewState({
    this.cacheProgress = 0,
  });

  @override
  List<Object> get props => [cacheProgress];

  RouteCacheProgressViewState copyWith({
    double? cacheProgress,
  }) {
    return RouteCacheProgressViewState(
      cacheProgress: cacheProgress ?? this.cacheProgress,
    );
  }
}
