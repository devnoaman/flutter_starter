import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/app/states/auth_state.dart';

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState.inital()) {
    // call the auth check function
    Future.doWhile(() => validate());
  }
  setAuthState(AuthState authState) {
    state = authState;
  }

  validate() {}
}
