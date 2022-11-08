import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nito_feature_auth/src/login/login_page_state.dart';
import 'package:nito_data_auth/nito_data_auth.dart';

final loginPageController =
    StateNotifierProvider<LoginPageController, LoginPageState>(
  (ref) => LoginPageController(
    ref.read(authRepositoryProvider),
  ),
);

class LoginPageController extends StateNotifier<LoginPageState> {
  LoginPageController(this._authRepository)
      : emailController = TextEditingController(text: ''),
        passwordController = TextEditingController(text: ''),
        super(const LoginPageState());

  final AuthRepository _authRepository;

  final TextEditingController emailController;
  final TextEditingController passwordController;

  void onPasswordFieldSubmitted() {
    if (!state.isLoginProcessing) {
      _login();
    }
  }

  void onSignInButtonPressed() {
    if (!state.isLoginProcessing) {
      _login();
    }
  }

  Future<void> _login() async {
    state = state.copyWith(isLoginProcessing: true);

    state = state.copyWith(
      isLogin: await _authRepository.signIn(
        emailController.text,
        passwordController.text,
      ),
    );

    state = state.copyWith(isLoginProcessing: false);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
