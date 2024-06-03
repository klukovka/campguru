import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

class FirebaseChatsRepository extends ChatsRepository {
  final FirebaseFirestore firestore;

  FirebaseChatsRepository({required this.firestore});

  @override
  Future<FailureOrResult<void>> createTripChat(
    Trip trip,
    String currentUserId,
  ) {
    // TODO: implement createTripChat
    throw UnimplementedError();
  }
}
