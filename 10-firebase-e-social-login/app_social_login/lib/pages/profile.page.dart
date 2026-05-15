import 'package:app_social_login/pages/login/login.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            if (FirebaseAuth.instance.currentUser != null)
              Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
            const SizedBox(height: 20),
            if (FirebaseAuth.instance.currentUser != null)
              Text(FirebaseAuth.instance.currentUser!.displayName!),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();

                if (!context.mounted) return;

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: Text("Sair", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
