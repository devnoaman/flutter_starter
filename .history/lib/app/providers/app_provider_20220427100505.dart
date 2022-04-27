import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/app/providers/connection_provider.dart';
import 'package:flutter_starter/app/providers/login_provider.dart';

final appProvider = FutureProvider((ref) async {
  final _connectionState = ref.watch(connectionProvider);

  _connectionState.whenOrNull(
    inital: () {
      return ref.watch(authStateProvider);
    },
    noConnection: (msg) {
      return ref.watch(authStateProvider);
    },
  );
  // return AuthState.notAuthenticated('err');
});
