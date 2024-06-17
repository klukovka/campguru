// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_review_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$NewReviewDtoToJson(NewReviewDto instance) {
  final val = <String, dynamic>{
    'text': instance.text,
    'rating': instance.rating,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('photos', instance.photos);
  return val;
}
