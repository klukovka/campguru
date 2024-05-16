import 'package:domain/domain.dart';

class Location extends FavoriteTableItem<Location> {
  final List<String> images;
  final String name;
  final double mark;
  final int reviewsAmount;
  final String? description;
  final List<String>? labels;
  final List<Review>? reviews;
  final double lng;
  final double lat;

  LatLng get latLng => LatLng(lat, lng);

  const Location({
    required super.id,
    required this.images,
    required this.name,
    required this.mark,
    required this.reviewsAmount,
    required super.isFavorite,
    this.description,
    this.labels,
    this.reviews,
    required this.lat,
    required this.lng,
  });

  @override
  Location copyWith({
    int? id,
    List<String>? images,
    String? name,
    double? mark,
    int? reviewsAmount,
    bool? isFavorite,
    String? description,
    List<String>? labels,
    List<Review>? reviews,
    double? lat,
    double? lng,
  }) {
    return Location(
      id: id ?? this.id,
      images: images ?? this.images,
      name: name ?? this.name,
      mark: mark ?? this.mark,
      reviewsAmount: reviewsAmount ?? this.reviewsAmount,
      isFavorite: isFavorite ?? this.isFavorite,
      description: description ?? this.description,
      labels: labels ?? this.labels,
      reviews: reviews ?? this.reviews,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      images,
      name,
      mark,
      reviewsAmount,
      isFavorite,
      description,
      labels,
      reviews,
      lat,
      lng,
    ];
  }

  @override
  Location merge(Location another) => copyWith(
        id: another.id,
        images: another.images,
        name: another.name,
        mark: another.mark,
        reviewsAmount: another.reviewsAmount,
        isFavorite: another.isFavorite,
        description: another.description,
        labels: another.labels,
        reviews: another.reviews,
        lat: another.lat,
        lng: another.lng,
      );
}
