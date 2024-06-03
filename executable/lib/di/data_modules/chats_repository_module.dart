import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ChatsRepositoryModule {
  @lazySingleton
  ChatsRepository chatsRepository(FirebaseFirestore firestore) =>
      FirebaseChatsRepository(
        firestore: firestore,
      );
}
