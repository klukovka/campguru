import 'dart:convert';

import 'package:data/src/core/dto.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class UserDto extends Dto<User> {
  final int id;
  final String email;
  final String name;
  final String surname;
  final String? photo;
  final DateTime? premiumExpirationDate;

  UserDto({
    required this.id,
    required this.email,
    required this.name,
    required this.surname,
    required this.photo,
    this.premiumExpirationDate,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  @override
  User toDomain() => User(
        id: id,
        email: email,
        name: name,
        surname: surname,
        photo: photo != null ? base64.decode(photo!) : null,
        premiumExpirationDate: premiumExpirationDate,
      );
}
