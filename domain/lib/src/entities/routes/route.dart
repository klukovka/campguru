import 'package:domain/domain.dart';

class Route extends FavoriteTableItem<Route> {
  final String name;
  final double mark;
  final String mapUrl;
  final double distance;
  final double duration;
  final int reviewsAmount;
  final bool isMine;
  final int? locationsAmount;
  final String? description;
  final List<FilterLabel>? labels;
  final List<Review>? reviews;
  final List<LatLng>? locations;
  final List<LatLng>? polyline;

  const Route({
    required super.id,
    required this.name,
    required this.mark,
    required this.mapUrl,
    required this.distance,
    required this.duration,
    required super.isFavorite,
    required this.reviewsAmount,
    required this.isMine,
    this.locations,
    this.description,
    this.labels,
    this.locationsAmount,
    this.reviews,
    this.polyline,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      mark,
      mapUrl,
      distance,
      duration,
      isFavorite,
      reviewsAmount,
      locationsAmount,
      description,
      labels,
      reviews,
      polyline,
      locations,
      isMine,
    ];
  }

  @override
  Route copyWith({
    int? id,
    double? mark,
    String? mapUrl,
    String? name,
    double? distance,
    double? duration,
    bool? isFavorite,
    bool? isMine,
    int? reviewsAmount,
    int? locationsAmount,
    String? description,
    List<FilterLabel>? labels,
    List<Review>? reviews,
    List<LatLng>? polyline,
    List<LatLng>? locations,
  }) {
    return Route(
      id: id ?? this.id,
      name: name ?? this.name,
      mark: mark ?? this.mark,
      mapUrl: mapUrl ?? this.mapUrl,
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
      isFavorite: isFavorite ?? this.isFavorite,
      reviewsAmount: reviewsAmount ?? this.reviewsAmount,
      locationsAmount: locationsAmount ?? this.locationsAmount,
      description: description ?? this.description,
      labels: labels ?? this.labels,
      reviews: reviews ?? this.reviews,
      polyline: polyline ?? this.polyline,
      locations: locations ?? this.locations,
      isMine: isMine ?? this.isMine,
    );
  }

  @override
  Route merge(Route another) => copyWith(
        id: another.id,
        name: another.name,
        mark: another.mark,
        mapUrl: another.mapUrl,
        distance: another.distance,
        duration: another.duration,
        isFavorite: another.isFavorite,
        reviewsAmount: another.reviewsAmount,
        locationsAmount: another.locationsAmount,
        description: another.description,
        labels: another.labels,
        reviews: another.reviews,
        polyline: another.polyline,
        locations: another.locations,
        isMine: another.isMine,
      );
}
