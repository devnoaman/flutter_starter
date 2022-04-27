import 'package:flutter/material.dart';
import 'package:flutter_starter/app/providers/connection_provider.dart';
import 'package:flutter_starter/app/providers/login_provider.dart';
import 'package:flutter_starter/utils/toast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authState = ref.watch(authStateProvider);
    var _connectionState = ref.watch(connectionProvider);

    MyToast.pushToast(context: context, text: 'text');
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: authState.whenOrNull(
            initial: () => Text('init'),
            authenticated: () => Text('authenticated'),
            notAuthenticated: (msg) => Text('notAuthenticated'),
          ),
        ),
      ),
    );
  }
}
