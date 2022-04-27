import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/app/states/auth_state.dart';

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState.inital()) {
    // call the auth check function
    int x = 0;
    Future.delayed(Duration(), () {
      state = AuthState.authenticated();
      Future.delayed(Duration(), () {
        state = AuthState.notAuthenticated('an error acured');
      });
    });
  }
  setAuthState(AuthState authState) {
    state = authState;
  }

  validate() {}
}
