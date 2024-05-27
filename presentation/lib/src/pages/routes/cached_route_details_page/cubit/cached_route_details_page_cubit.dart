import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cached_route_details_page_state.dart';

class CachedRouteDetailsPageCubit extends Cubit<CachedRouteDetailsPageState> {
  CachedRouteDetailsPageCubit() : super(const CachedRouteDetailsPageState());

  void updateRoute(Route route) => emit(state.copyWith(
        route: route,
      ));
}
