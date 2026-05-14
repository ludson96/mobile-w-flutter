import 'package:app_social_login/pages/login/widgets/login_button.widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
        .authenticate();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser.authentication!;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: .symmetric(vertical: 20, horizontal: 35),
          child: Column(
            crossAxisAlignment: .stretch,
            mainAxisAlignment: .center,
            children: [
              const Text(
                "Create an account or sign in to save and see your conversation history",
                style: TextStyle(fontSize: 32, fontWeight: .w500),
                textAlign: .center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .1),
              LoginButton(
                pathImage: "assets/images/google.png",
                text: "Continue with Google",
                onPressed: () async {},
              ),
              const SizedBox(height: 15),
              LoginButton(
                pathImage: "assets/images/facebook.png",
                text: "Continue with Facebook",
                onPressed: () async {},
              ),
              const SizedBox(height: 15),
              LoginButton(
                pathImage: "assets/images/apple.png",
                text: "Continue with Apple",
                onPressed: () async {},
              ),
              const SizedBox(height: 40),
              Row(
                children: const [
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding: .symmetric(horizontal: 10),
                    child: Text("or", style: TextStyle(fontSize: 20)),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 40),
              LoginButton(
                icon: Icons.phone_iphone,
                text: "Use phone number",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
