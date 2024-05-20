// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$NewUserDtoToJson(NewUserDto instance) {
  final val = <String, dynamic>{
    'email': instance.email,
    'password': instance.password,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('photo', instance.photo);
  return val;
}
