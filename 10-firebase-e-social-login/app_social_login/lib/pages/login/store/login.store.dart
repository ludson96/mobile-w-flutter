import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

part 'login.store.g.dart';

// ignore: library_private_types_in_public_api
class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  bool _isGoogleLoading = false;
  bool get isGoogleLoading => _isGoogleLoading;

  @observable
  bool _isFacebookLoading = false;
  bool get isFacebookLoading => _isFacebookLoading;

  bool _isGoogleSignInInitialized = false;

  // O Web Client ID é público, mas armazená-lo como constante limpa o código
  static const String _googleServerClientId =
      '498938020314-psptdhfm6uh6h27rl4cng7rcu676431n.apps.googleusercontent.com';
      
  @action
  Future<UserCredential?> signInWithGoogle() async {
    _isGoogleLoading = true;

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
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      _isGoogleLoading = false;

      return userCredential;
    } catch (e) {
      debugPrint('Erro no login com Google: $e');
      return null;
    }
  }

  @action
  Future<UserCredential?> signInWithFacebook() async {
    _isFacebookLoading = true;

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
        final userCredential = await FirebaseAuth.instance.signInWithCredential(
          facebookAuthCredential,
        );

        _isFacebookLoading = false;

        return userCredential;
      }
      return null;
    } catch (e) {
      debugPrint('Erro no login com Facebook: $e');
      return null;
    }
  }
}
