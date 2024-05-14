import 'dart:developer';

import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class GeopositionPresenter implements GeopositionOutputPort {
  final RouteMapPageCubit routeMapPageCubit;

  GeopositionPresenter({
    required this.routeMapPageCubit,
  });
  @override
  void setGeopositionEnabled(bool enabled) {
    log('setGeopositionEnabled $enabled');
  }

  @override
  void updateUserPosition(LatLng latLng) {
    log('${latLng.latitude};${latLng.longitude}');
  }
}
