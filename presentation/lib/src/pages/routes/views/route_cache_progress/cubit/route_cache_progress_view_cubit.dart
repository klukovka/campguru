import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'route_cache_progress_view_state.dart';

class RouteCacheProgressViewCubit extends Cubit<RouteCacheProgressViewState> {
  RouteCacheProgressViewCubit() : super(const RouteCacheProgressViewState());

  void updateProgress(double cacheProgress) => emit(state.copyWith(
        cacheProgress: cacheProgress,
      ));
}
