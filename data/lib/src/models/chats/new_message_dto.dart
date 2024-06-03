import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_message_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class NewMessageDto {
  final String userId;
  final String text;
  final DateTime sentAt;
  final List<String> read;

  NewMessageDto({
    required this.sentAt,
    required this.text,
    required this.userId,
    required this.read,
  });

  factory NewMessageDto.fromDomain(NewMessage message) => NewMessageDto(
        sentAt: DateTime.now().toUtc(),
        text: message.text,
        userId: message.userId,
        read: [message.userId],
      );

  Map<String, dynamic> toJson() => _$NewMessageDtoToJson(this);
}