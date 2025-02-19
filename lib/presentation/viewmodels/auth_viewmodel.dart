import 'package:firebase_auth/firebase_auth.dart';

class AuthViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Registrar um novo usuário
  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print("Erro ao registrar: $e");
    }
  }

  // Login com email e senha
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print("Erro ao fazer login: $e");
    }
  }

  // Logout
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
