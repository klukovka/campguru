import 'package:data/src/core/dto.dart';
import 'package:data/src/data_source/hive_type_id.dart';
import 'package:data/src/filters/filter_label_ext.dart';
import 'package:data/src/models/routes/lat_lng_dto.dart';
import 'package:domain/domain.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'route_hive_dto.g.dart';

@HiveType(typeId: HiveTypeId.route)
class RouteHiveDto extends Dto<Route> {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final bool isFavorite;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final double mark;
  @HiveField(4)
  final String mapUrl;
  @HiveField(5)
  final double distance;
  @HiveField(6)
  final double duration;
  @HiveField(7)
  final int reviewsAmount;
  @HiveField(8)
  final int? locationsAmount;
  @HiveField(9)
  final String? description;
  @HiveField(10)
  final List<String>? labels;
  @HiveField(11)
  final List<LatLngDto>? locations;
  @HiveField(12)
  final List<LatLngDto>? polyline;
  @HiveField(13)
  final bool isMine;

  RouteHiveDto({
    required this.id,
    required this.isFavorite,
    required this.name,
    required this.mark,
    required this.mapUrl,
    required this.distance,
    required this.duration,
    required this.reviewsAmount,
    required this.locationsAmount,
    required this.description,
    required this.labels,
    required this.locations,
    required this.polyline,
    this.isMine = false,
  });

  factory RouteHiveDto.fromDomain(Route route) => RouteHiveDto(
        id: route.id,
        isFavorite: route.isFavorite,
        name: route.name,
        mark: route.mark,
        mapUrl: route.mapUrl,
        distance: route.distance,
        duration: route.duration,
        reviewsAmount: route.reviewsAmount,
        locationsAmount: route.locationsAmount,
        description: route.description,
        labels: route.labels?.map((e) => e.apiValue).toList(),
        locations: route.locations
            ?.map((latLng) => LatLngDto.fromDomain(latLng))
            .toList(),
        polyline: route.polyline
            ?.map((latLng) => LatLngDto.fromDomain(latLng))
            .toList(),
        isMine: route.isMine,
      );

  @override
  Route toDomain() {
    final filterLabels = <FilterLabel>[];
    for (final label in labels ?? []) {
      final filterLabel = FilterLabel.values
          .firstWhereOrNull((element) => element.apiValue == label);
      if (filterLabel != null) {
        filterLabels.add(filterLabel);
      }
    }
    return Route(
      id: id,
      name: name,
      mark: mark,
      mapUrl: mapUrl,
      distance: distance,
      duration: duration,
      isFavorite: isFavorite,
      reviewsAmount: reviewsAmount,
      locations: locations?.map((e) => e.toDomain()).toList(),
      description: description,
      labels: filterLabels,
      locationsAmount: locationsAmount,
      polyline: polyline?.map((e) => e.toDomain()).toList(),
      isMine: isMine,
    );
  }
}
