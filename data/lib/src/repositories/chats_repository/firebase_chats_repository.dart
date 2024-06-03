import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/src/models/chats/message_dto.dart';
import 'package:data/src/models/chats/new_chat_dto.dart';
import 'package:data/src/models/chats/new_message_dto.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class FirebaseChatsRepository extends ChatsRepository {
  final FirebaseFirestore firestore;

  FirebaseChatsRepository({required this.firestore});

  @override
  Future<FailureOrResult<void>> createTripChat(
    Trip trip,
    String currentUserId,
  ) async {
    final result = await _makeErrorHandledCall(() async {
      final chat = NewChatDto.fromDomain(trip, currentUserId);
      final doc = firestore.doc('chats/${chat.id}');
      await doc.set(chat.toJson());
    });
    return result;
  }

  @override
  Future<FailureOrResult<void>> sendMessage(NewMessage newMessage) async {
    return await _makeErrorHandledCall(() async {
      final messages =
          firestore.collection('chats/${newMessage.chatId}/messages');
      final message = messages.doc();
      await message.set({
        'id': message.id,
        ...NewMessageDto.fromDomain(newMessage).toJson(),
      });
    });
  }

  @override
  Future<FailureOrResult<Message?>> getFirstUnreadMessage({
    required String userId,
    required String chatId,
  }) async {
    return await _makeErrorHandledCall(() async {
      final messages = await firestore
          .collection('chats/$chatId/messages')
          .orderBy('sent_at')
          .where('unread', arrayContains: userId)
          .limit(1)
          .get();
      final messageData = messages.docs.firstOrNull()?.data();
      if (messageData == null) return null;
      return MessageDto.fromJson(messageData).toDomain();
    });
  }

  @override
  Future<FailureOrResult<List<Message>>> getAfterMessage({
    required String chatId,
    required String messageId,
  }) async {
    return _makeErrorHandledCall(() async {
      final message =
          await firestore.doc('chats/$chatId/messages/$messageId').get();
      final messages = await firestore
          .collection('chats/$chatId/messages')
          .orderBy('sent_at')
          .startAfterDocument(message)
          .limit(20)
          .get();

      return messages.docs
          .map((e) => MessageDto.fromJson(e.data()).toDomain())
          .toList();
    });
  }

  @override
  Future<FailureOrResult<List<Message>>> getBeforeMessage({
    required String chatId,
    String? messageId,
  }) async {
    return _makeErrorHandledCall(() async {
      final messages =
          firestore.collection('chats/$chatId/messages').orderBy('sent_at');

      final message = messageId != null
          ? await firestore.doc('chats/$chatId/messages/$messageId').get()
          : null;

      final query =
          message != null ? messages.endBeforeDocument(message) : messages;
      final docs = (await query.limit(20).get()).docs;

      return docs
          .map((e) => MessageDto.fromJson(e.data()).toDomain())
          .toList()
          .reversed
          .toList();
    });
  }
}

Future<FailureOrResult<T>> _makeErrorHandledCall<T>(
  AsyncValueGetter<T> callback,
) async {
  try {
    final result = await callback();

    return FailureOrResult.success(result);
  } on PlatformException {
    return FailureOrResult.failure(ApplicationFailure(
      type: ApplicationErrorType.general,
    ));
  } on SocketException {
    return FailureOrResult.failure(ApplicationFailure(
      type: ApplicationErrorType.noInternetConnection,
    ));
  } on FirebaseException catch (firebaseException) {
    final errorMessage = firebaseException.message;
    return FailureOrResult.failure(ApiFailure(
      message: errorMessage ?? '',
      code: 'FirebaseException',
    ));
  } catch (exception) {
    return FailureOrResult.failure(ApplicationFailure(
      type: ApplicationErrorType.general,
    ));
  }
}
