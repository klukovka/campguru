import 'package:domain/domain.dart';

class Route extends FavoriteTableItem<Route> {
  final String name;
  final double mark;
  final String mapUrl;
  final double distance;
  final double duration;
  final int reviewsAmount;
  final int? locationsAmount;
  final String? description;
  final List<String>? labels;
  final List<Review>? reviews;
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
    int? reviewsAmount,
    int? locationsAmount,
    String? description,
    List<String>? labels,
    List<Review>? reviews,
    List<LatLng>? polyline,
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
      );
}
