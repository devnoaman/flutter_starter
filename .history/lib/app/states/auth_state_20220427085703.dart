import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.inital() = _inital;
  const factory AuthState.authenticated() = authenticated;
  const factory AuthState.notAuthenticated(String err) = notAuthenticated;
}
