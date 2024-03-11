import 'package:domain/src/entities/core/table_item.dart';
import 'package:equatable/equatable.dart';

class Location extends Equatable with TableItem<Location> {
  @override
  final int id;
  final List<String> images;
  final String name;
  final double mark;
  final int reviewsAmount;
  final bool isFavorite;

  Location({
    required this.id,
    required this.images,
    required this.name,
    required this.mark,
    required this.reviewsAmount,
    required this.isFavorite,
  });

  Location copyWith({
    int? id,
    List<String>? images,
    String? name,
    double? mark,
    int? reviewsAmount,
    bool? isFavorite,
  }) {
    return Location(
      id: id ?? this.id,
      images: images ?? this.images,
      name: name ?? this.name,
      mark: mark ?? this.mark,
      reviewsAmount: reviewsAmount ?? this.reviewsAmount,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      images,
      name,
      mark,
      reviewsAmount,
      isFavorite,
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
      );
}
