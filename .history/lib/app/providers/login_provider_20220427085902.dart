import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/app/states/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState.inital());
}
