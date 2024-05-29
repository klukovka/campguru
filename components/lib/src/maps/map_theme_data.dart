import 'package:flutter/material.dart';

class MapThemeData extends ThemeExtension<MapThemeData> {
  final IconData mapMarker;
  final IconData humanMarker;

  MapThemeData({
    required this.mapMarker,
    required this.humanMarker,
  });

  @override
  ThemeExtension<MapThemeData> copyWith({
    IconData? mapMarker,
    IconData? humanMarker,
  }) =>
      MapThemeData(
        mapMarker: mapMarker ?? this.mapMarker,
        humanMarker: humanMarker ?? this.humanMarker,
      );

  @override
  ThemeExtension<MapThemeData> lerp(
          covariant ThemeExtension<MapThemeData>? other, double t) =>
      this;
}
