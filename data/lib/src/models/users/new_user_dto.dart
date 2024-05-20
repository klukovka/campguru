import 'dart:typed_data';

import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_user_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class NewUserDto {
  final String email;
  final String password;
  final String name;
  final String surname;
  final Uint8List? photo;

  NewUserDto({
    required this.email,
    required this.password,
    required this.name,
    required this.photo,
    required this.surname,
  });

  factory NewUserDto.fromDomain(NewUser newUser) => NewUserDto(
        email: newUser.email,
        password: newUser.password,
        name: newUser.name,
        photo: newUser.photo,
        surname: newUser.surname,
      );

  Map<String, dynamic> toJson() => _$NewUserDtoToJson(this);
}
