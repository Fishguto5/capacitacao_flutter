import 'package:firebase_auth/firebase_auth.dart';
Future<void> loginUser(String email,String password ) async{
  try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        print('Usuário autenticado: ${user.email}');
      }
    } catch (e) {
      print('Erro ao autenticar: $e');
    }
  } 