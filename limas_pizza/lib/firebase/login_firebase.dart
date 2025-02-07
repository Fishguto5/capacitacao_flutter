import 'package:firebase_auth/firebase_auth.dart';
Future<bool> loginUser(String email,String password ) async{
  try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        // ignore: duplicate_ignore
        // ignore: avoid_print
        print('Usuário autenticado: ${user.email}');
      }
    } catch (e) {
      print('Erro ao autenticar: $e');
      return false;
    }
    return true;
  } 