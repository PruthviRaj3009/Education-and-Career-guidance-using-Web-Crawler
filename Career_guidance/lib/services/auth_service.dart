import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  const AuthService();

  User? get currentUser => FirebaseAuth.instance.currentUser;

  Future<void> reauthenticateWithPassword({
    required String email,
    required String password,
  }) async {
    final credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    await FirebaseAuth.instance.currentUser?.reauthenticateWithCredential(
      credential,
    );
  }

  Future<void> deleteCurrentUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.delete();
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
