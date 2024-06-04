import 'package:data/src/core/dto.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_dto.g.dart';

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class MessageDto extends Dto<Message> {
  final String id;
  final DateTime sentAt;
  final String text;
  final List<String> unread;
  final String userId;
  final List<String>? attachments;

  MessageDto({
    required this.id,
    required this.sentAt,
    required this.text,
    required this.unread,
    required this.userId,
    this.attachments,
  });

  factory MessageDto.fromJson(Map<String, dynamic> json) =>
      _$MessageDtoFromJson(json);

  @override
  Message toDomain() => Message(
        id: id,
        text: text,
        sentAt: sentAt,
        unread: unread,
        userId: userId,
        attachments: attachments,
      );
}
