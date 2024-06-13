import 'package:data/src/core/dto.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_dto.g.dart';

@JsonSerializable(createToJson: false)
class LocationDto extends Dto<Location> {
  final int id;
  final List<String> images;
  final String name;
  final double mark;
  final int reviewsAmount;
  final bool isFavorite;
  final double long;
  final double lat;

  LocationDto({
    required this.id,
    required this.images,
    required this.name,
    required this.mark,
    required this.reviewsAmount,
    required this.isFavorite,
    required this.long,
    required this.lat,
  });

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);

  @override
  Location toDomain() => Location(
        id: id,
        images: images,
        name: name,
        mark: mark,
        reviewsAmount: reviewsAmount,
        isFavorite: isFavorite,
        lat: lat,
        lng: long,
      );
}
