import 'package:equatable/equatable.dart';

class NewMessage extends Equatable {
  final String userId;
  final String text;
  final String chatId;
  final List<String> unread;

  NewMessage({
    required this.text,
    required this.userId,
    required this.chatId,
    required this.unread,
  });

  @override
  List<Object?> get props {
    return [
      userId,
      text,
      chatId,
      unread,
    ];
  }

  NewMessage copyWith({
    String? userId,
    String? text,
    String? chatId,
    List<String>? unread,
  }) {
    return NewMessage(
      userId: userId ?? this.userId,
      text: text ?? this.text,
      chatId: chatId ?? this.chatId,
      unread: unread ?? this.unread,
    );
  }
}
