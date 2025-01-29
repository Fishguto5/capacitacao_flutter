import 'package:flutter/material.dart';
import 'package:limas_pizza/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //  Inicializa o binding
  await Firebase.initializeApp( //  Configura o Firebase
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp()); // Inicia o app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(), // 🏠 Define a tela inicial
    );
  }
}