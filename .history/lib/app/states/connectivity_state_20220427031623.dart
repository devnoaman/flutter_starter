import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class ConnectionState with _$ConnectionState {
  const factory ConnectionState.noConnection() = _noConnection;
  const factory ConnectionState.mobile() = mobileData;
  const factory ConnectionState.wifi() = wifi;
}
