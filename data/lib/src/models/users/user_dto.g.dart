// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      photo: json['photo'] as String?,
      premiumExpirationDate: json['premiumExpirationDate'] == null
          ? null
          : DateTime.parse(json['premiumExpirationDate'] as String),
    );
