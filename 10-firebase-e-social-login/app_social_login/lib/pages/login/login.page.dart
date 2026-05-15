import 'package:app_social_login/pages/login/widgets/login_button.widget.dart';
import 'package:app_social_login/pages/profile.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool _isGoogleSignInInitialized = false;

class _LoginPageState extends State<LoginPage> {
  // O Web Client ID é público, mas armazená-lo como constante limpa o código
  static const String _googleServerClientId =
      '498938020314-psptdhfm6uh6h27rl4cng7rcu676431n.apps.googleusercontent.com';

  Future<UserCredential?> signInWithGoogle() async {
    try {
      if (!_isGoogleSignInInitialized) {
        await GoogleSignIn.instance.initialize(
          serverClientId: _googleServerClientId,
        );
        _isGoogleSignInInitialized = true;
      }

      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      debugPrint('Erro no login com Google: $e');
      return null;
    }
  }

  Future<UserCredential?> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Verifica se o login teve sucesso e se o token não é nulo
      if (loginResult.status == LoginStatus.success &&
          loginResult.accessToken != null) {
        // Usa '!' para indicar ao Dart que o accessToken não é nulo
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(
              loginResult.accessToken!.tokenString,
            );

        // Once signed in, return the UserCredential
        return await FirebaseAuth.instance.signInWithCredential(
          facebookAuthCredential,
        );
      }
      return null;
    } catch (e) {
      debugPrint('Erro no login com Facebook: $e');
      return null;
    }
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
                onPressed: () async {
                  final userCredential = await signInWithGoogle();

                  if (userCredential != null && context.mounted) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 15),
              LoginButton(
                pathImage: "assets/images/facebook.png",
                text: "Continue with Facebook",
                onPressed: () async {
                  await signInWithFacebook();

                  if (context.mounted) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  }
                },
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
