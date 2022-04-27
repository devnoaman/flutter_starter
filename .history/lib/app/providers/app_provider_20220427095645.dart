import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/app/providers/connection_provider.dart';
import 'package:flutter_starter/app/providers/login_provider.dart';
import 'package:flutter_starter/app/states/auth_state.dart';

final appProvider = FutureProvider((ref) async {
  final _connectionState = ref.watch(connectionProvider);

  _connectionState.whenOrNull(
    inital: () {
      return ref.watch(authStateProvider);
    },
    // ethernet: (msg) {
    // },
    noConnection: (msg) {
      return ref.watch(authStateProvider);
    },
    // mobile: (msg) {},
    // wifi: (msg) {},
  );
  // return AuthState.notAuthenticated('err');
});
