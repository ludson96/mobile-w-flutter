// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStore, Store {
  late final _$_isGoogleLoadingAtom =
      Atom(name: '_LoginStore._isGoogleLoading', context: context);

  @override
  bool get _isGoogleLoading {
    _$_isGoogleLoadingAtom.reportRead();
    return super._isGoogleLoading;
  }

  @override
  set _isGoogleLoading(bool value) {
    _$_isGoogleLoadingAtom.reportWrite(value, super._isGoogleLoading, () {
      super._isGoogleLoading = value;
    });
  }

  late final _$_isFacebookLoadingAtom =
      Atom(name: '_LoginStore._isFacebookLoading', context: context);

  @override
  bool get _isFacebookLoading {
    _$_isFacebookLoadingAtom.reportRead();
    return super._isFacebookLoading;
  }

  @override
  set _isFacebookLoading(bool value) {
    _$_isFacebookLoadingAtom.reportWrite(value, super._isFacebookLoading, () {
      super._isFacebookLoading = value;
    });
  }

  late final _$signInWithGoogleAsyncAction =
      AsyncAction('_LoginStore.signInWithGoogle', context: context);

  @override
  Future<UserCredential?> signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  late final _$signInWithFacebookAsyncAction =
      AsyncAction('_LoginStore.signInWithFacebook', context: context);

  @override
  Future<UserCredential?> signInWithFacebook() {
    return _$signInWithFacebookAsyncAction
        .run(() => super.signInWithFacebook());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
