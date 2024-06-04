import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_chat_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class NewChatDto {
  final String id;
  final String ownerId;
  final List<String> users;

  NewChatDto({
    required this.id,
    required this.ownerId,
    required this.users,
  });

  factory NewChatDto.fromDomain(
    Trip trip,
    String currentUserId,
  ) =>
      NewChatDto(
        id: trip.id.toString(),
        ownerId: currentUserId,
        users: [
          currentUserId,
          ...(trip.users ?? []).map((e) => e.id.toString())
        ],
      );

  Map<String, dynamic> toJson() => _$NewChatDtoToJson(this);
}
