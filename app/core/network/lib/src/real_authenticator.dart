import 'package:nito_network/src/authenticator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RealAuthenticator implements Authenticator {
  final GoTrueClient _client;

  RealAuthenticator({required GoTrueClient client}) : _client = client;

  @override
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await _client.signInWithPassword(email: email, password: password);
  }
}
