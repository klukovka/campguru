import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as flutter_map;
import 'package:presentation/src/utils/extensions/domain_list_lat_lng_extension.dart';
import 'package:presentation/src/utils/extensions/google_list_lat_lng_extension.dart';

part 'cached_route_map_page_state.dart';

class CachedRouteMapPageCubit extends Cubit<CachedRouteMapPageState> {
  CachedRouteMapPageCubit() : super(const CachedRouteMapPageState());

  void updateRoute(Route route) => emit(state.copyWith(
        route: route,
      ));

  void updateRouteFavoriteStatus(bool isFavorite) => emit(state.copyWith(
        route: state.route.copyWith(isFavorite: isFavorite),
      ));

  void updateEnabledGeoposition(bool enabled) => emit(state.copyWith(
        isGeopositionEnabled: enabled,
      ));

  void updateCurrentLocation(LatLng latLng) => emit(state.copyWith(
        currentPosition: latLng,
      ));
}
