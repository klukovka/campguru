import 'dart:developer';

import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:presentation/presentation.dart';

class GeopositionPresenter implements GeopositionOutputPort {
  final RouteMapPageCubit routeMapPageCubit;

  GeopositionPresenter({
    required this.routeMapPageCubit,
  });
  @override
  void setGeopositionEnabled(bool enabled) {
    routeMapPageCubit.updateEnabledGeoposition(enabled);
  }

  @override
  void updateUserPosition(LatLng latLng) {
    if (kDebugMode) log('${latLng.latitude};${latLng.longitude}');
    routeMapPageCubit.updateCurrentLocation(latLng);
  }
}
