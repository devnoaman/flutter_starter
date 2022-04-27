import 'package:freezed_annotation/freezed_annotation.dart';

part 'connectivity_state.freezed.dart';

@freezed
class MyConnectionState with _$MyConnectionState {
  const factory MyConnectionState.noConnection() = _noConnection;
  const factory MyConnectionState.mobile() = mobileData;
  const factory MyConnectionState.wifi() = wifi;
}
