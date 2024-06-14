import 'package:data/src/core/dto.dart';
import 'package:data/src/filters/filter_label_ext.dart';
import 'package:data/src/models/reviews/review_dto.dart';
import 'package:data/src/models/routes/lat_lng_dto.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'route_dto.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class RouteDto extends Dto<Route> {
  final int id;
  final bool isFavorite;
  final String name;
  final double mark;
  final String mapUrl;
  final double distance;
  final double duration;
  final int reviewsAmount;
  final bool isMine;
  final int? locationsAmount;
  final String? description;
  final List<String>? labels;
  final List<ReviewDto>? reviews;
  final List<LatLngDto>? locations;
  final List<String>? polyline;

  RouteDto({
    required this.id,
    required this.isFavorite,
    required this.name,
    required this.mark,
    required this.mapUrl,
    required this.distance,
    required this.duration,
    required this.reviewsAmount,
    required this.isMine,
    required this.locationsAmount,
    required this.description,
    required this.labels,
    required this.reviews,
    required this.locations,
    required this.polyline,
  });

  factory RouteDto.fromJson(Map<String, dynamic> json) =>
      _$RouteDtoFromJson(json);

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
      isMine: isMine,
      locations: locations?.map((e) => e.toDomain()).toList(),
      description: description,
      labels: filterLabels,
      locationsAmount: locationsAmount,
      reviews: reviews?.map((e) => e.toDomain()).toList(),
      polyline: polyline
          ?.expand((element) => decodeEncodedPolyline(element))
          .toList(),
    );
  }
}

List<LatLng> decodeEncodedPolyline(String encoded) {
  List<LatLng> poly = [];
  int index = 0, len = encoded.length;
  int lat = 0, lng = 0;

  while (index < len) {
    int b, shift = 0, result = 0;
    do {
      b = encoded.codeUnitAt(index++) - 63;
      result |= (b & 0x1f) << shift;
      shift += 5;
    } while (b >= 0x20);
    int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
    lat += dlat;

    shift = 0;
    result = 0;
    do {
      b = encoded.codeUnitAt(index++) - 63;
      result |= (b & 0x1f) << shift;
      shift += 5;
    } while (b >= 0x20);
    int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
    lng += dlng;
    LatLng p = LatLng((lat / 1E5).toDouble(), (lng / 1E5).toDouble());
    poly.add(p);
  }
  return poly;
}
