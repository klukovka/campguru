import 'package:equatable/equatable.dart';

class NewMessage extends Equatable {
  final String userId;
  final String text;
  final String chatId;

  NewMessage({
    required this.text,
    required this.userId,
    required this.chatId,
  });

  @override
  List<Object?> get props {
    return [
      userId,
      text,
      chatId,
    ];
  }

  NewMessage copyWith({
    String? userId,
    String? text,
    String? chatId,
  }) {
    return NewMessage(
      userId: userId ?? this.userId,
      text: text ?? this.text,
      chatId: chatId ?? this.chatId,
    );
  }
}
