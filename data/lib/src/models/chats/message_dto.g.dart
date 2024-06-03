// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageDto _$MessageDtoFromJson(Map<String, dynamic> json) => MessageDto(
      id: json['id'] as String,
      sentAt: DateTime.parse(json['sent_at'] as String),
      text: json['text'] as String,
      unread:
          (json['unread'] as List<dynamic>).map((e) => e as String).toList(),
      userId: json['user_id'] as String,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
