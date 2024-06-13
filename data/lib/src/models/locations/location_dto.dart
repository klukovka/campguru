import 'package:data/src/core/dto.dart';
import 'package:data/src/filters/filter_label_ext.dart';
import 'package:data/src/models/reviews/review_dto.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_dto.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class LocationDto extends Dto<Location> {
  final int id;
  final List<String> images;
  final String name;
  final double mark;
  final int reviewsAmount;
  final bool isFavorite;
  final double long;
  final double lat;
  final String? description;
  final List<String>? labels;
  final List<ReviewDto>? reviews;

  LocationDto({
    required this.id,
    required this.images,
    required this.name,
    required this.mark,
    required this.reviewsAmount,
    required this.isFavorite,
    required this.long,
    required this.lat,
    this.description,
    this.labels,
    this.reviews,
  });

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);

  @override
  Location toDomain() {
    final filterLabels = <FilterLabel>[];
    for (final label in labels ?? []) {
      final filterLabel = FilterLabel.values
          .firstWhereOrNull((element) => element.apiValue == label);
      if (filterLabel != null) {
        filterLabels.add(filterLabel);
      }
    }
    return Location(
      id: id,
      images: images,
      name: name,
      mark: mark,
      reviewsAmount: reviewsAmount,
      isFavorite: isFavorite,
      lat: lat,
      lng: long,
      description: description,
      reviews: reviews?.map((e) => e.toDomain()).toList(),
      labels: filterLabels,
    );
  }
}
