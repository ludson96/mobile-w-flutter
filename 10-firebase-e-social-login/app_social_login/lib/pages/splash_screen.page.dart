import 'package:app_social_login/pages/login/login.page.dart';
import 'package:app_social_login/pages/profile.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();

    // Future.microtask permite usar o contexto em um initState, com sem ele lançaria um erro, apesar de funcionar.
    Future.microtask(() {
      // Verifica se o widget ainda está ativo na árvore de widgets
      if (!mounted) return;

      // Se o usuário não estiver locago o currentUser vai retornar null
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(color: Colors.green)),
    );
  }
}
