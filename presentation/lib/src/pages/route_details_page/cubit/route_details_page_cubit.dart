import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'route_details_page_state.dart';

class RouteDetailsPageCubit extends Cubit<RouteDetailsPageState> {
  RouteDetailsPageCubit() : super(const RouteDetailsPageState());

  void startLoading() => emit(state.copyWith(
        isLoading: true,
        hasError: false,
      ));

  void updateRoute(Route route) => emit(state.copyWith(
        route: route,
        isLoading: false,
      ));

  void updateRouteFavoriteStatus(bool isFavorite) => emit(state.copyWith(
        route: state.route.copyWith(isFavorite: isFavorite),
      ));

  void setHasError() => emit(state.copyWith(hasError: false));
}
