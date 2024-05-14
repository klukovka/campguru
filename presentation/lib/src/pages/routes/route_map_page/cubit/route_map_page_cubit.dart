import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'route_map_page_state.dart';

class RouteMapPageCubit extends Cubit<RouteMapPageState> {
  RouteMapPageCubit() : super(const RouteMapPageState());

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

  void updateEnabledGeoposition(bool enabled) => emit(state.copyWith(
        isGeopositionEnabled: enabled,
      ));

  void updateCurrentLocation(LatLng latLng) => emit(state.copyWith(
        currentPosition: latLng,
      ));
}
