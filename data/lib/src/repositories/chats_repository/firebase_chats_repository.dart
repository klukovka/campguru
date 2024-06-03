import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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
