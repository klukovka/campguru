import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:executable/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseModule {
  @lazySingleton
  @preResolve
  Future<FirebaseApp> app() => Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

  @lazySingleton
  FirebaseFirestore firebaseFirestore(FirebaseApp app) =>
      FirebaseFirestore.instanceFor(app: app);
}
