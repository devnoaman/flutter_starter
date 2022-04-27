import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/app/providers/connection_provider.dart';
import 'package:flutter_starter/app/states/auth_state.dart';
import 'package:flutter_starter/app/states/connectivity_state.dart';
import 'package:flutter_starter/app/states/connectivity_state.dart';

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  var _connectionState = ref.watch(connectionProvider);
  bool isConnected = _connectionState.maybeWhen(
    noConnection: (msg) => false,
    orElse: () => true,
  );
  return AuthNotifier(isConnected);
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(bool bool) : super(const AuthState.initial()) {
    // call the auth check function
    print(bool);

    if (mounted) {
      if (bool) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            state = const AuthState.authenticated();
          }
          Future.delayed(const Duration(milliseconds: 500), () {
            if (mounted) {
              state = const AuthState.notAuthenticated('an error acured');
            }
          });
        });
      }
    }
  }
  setAuthState(AuthState authState) {
    state = authState;
  }

  validate() {}
}
