import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> ReGisterUser(String email, String password) async{ //função que registra o usuário no Firebase Authentication
  try {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}}


 FirebaseFirestore db = FirebaseFirestore.instance;
void addEmployee(String name) async { //função que adiciona usuário no banco Firestore Database
  try {
    await db.collection('employees').add({
      'name': name,
      'role': '',
    });
    print('Funcionário adicionado com sucesso!');
  } catch (e) {
    print('Erro ao adicionar funcionário: $e');
  }
}