import 'package:freezed_annotation/freezed_annotation.dart';

part 'connectivity_state.freezed.dart';

@freezed
class MyConnectionState with _$MyConnectionState {
  const factory MyConnectionState.inital() = _inital;
  const factory MyConnectionState.noConnection(String msg) = _noConnection;
  const factory MyConnectionState.mobile(String msg) = mobileData;
  const factory MyConnectionState.wifi(String msg) = wifi;
}
