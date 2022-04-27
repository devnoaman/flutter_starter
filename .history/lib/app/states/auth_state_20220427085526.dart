import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.inital() = _inital;
  const factory AuthState.ethernet(String msg) = ethernet;

  const factory AuthState.noConnection(String msg) = _noConnection;
  const factory AuthState.mobile(String msg) = mobileData;
  const factory AuthState.wifi(String msg) = wifi;
}
