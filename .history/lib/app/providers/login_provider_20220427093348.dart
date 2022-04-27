import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/app/providers/connection_provider.dart';
import 'package:flutter_starter/app/states/auth_state.dart';
import 'package:flutter_starter/app/states/connectivity_state.dart';
import 'package:flutter_starter/app/states/connectivity_state.dart';

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  var _connectionState = ref.read(connectionProvider);

  return AuthNotifier(
      _connectionState == const MyConnectionState.noConnection(''));
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(bool bool) : super(const AuthState.inital()) {
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
