import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String id;
  final String text;
  final DateTime sentAt;
  final String userId;
  final List<String> unread;
  final List<String>? attachments;

  Message({
    required this.id,
    required this.text,
    required this.sentAt,
    required this.unread,
    required this.userId,
    this.attachments,
  });

  @override
  List<Object?> get props {
    return [
      id,
      text,
      userId,
      sentAt,
      unread,
      attachments,
    ];
  }
}
