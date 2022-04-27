import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/app/states/auth_state.dart';

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState.inital()) {
    // call the auth check function

    Future.delayed(const Duration(milliseconds: 500), () {
      state = const AuthState.authenticated();
      Future.delayed(const Duration(milliseconds: 500), () {
        state = const AuthState.notAuthenticated('an error acured');
      });
    });
  }
  setAuthState(AuthState authState) {
    state = authState;
  }

  validate() {}
}
