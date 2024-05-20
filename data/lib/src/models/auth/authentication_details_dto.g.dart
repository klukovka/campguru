// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationDetailsDto _$AuthenticationDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    AuthenticationDetailsDto(
      userId: (json['user_id'] as num).toInt(),
      accessJwtToken: json['access_jwt_token'] as String,
      refreshJwtToken: json['refresh_jwt_token'] as String?,
    );
