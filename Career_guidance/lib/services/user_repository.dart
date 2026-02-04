import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  const UserRepository();

  Future<void> deleteUserData(String uid) async {
    // Placeholder for Firestore deletions if enabled in the future.
    // No-op since Firestore is not in use per current settings.
    return;
  }

  User? get currentUser => FirebaseAuth.instance.currentUser;
}
