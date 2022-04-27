import 'package:flutter/material.dart';
import 'package:flutter_starter/app/providers/app_provider.dart';
import 'package:flutter_starter/app/providers/connection_provider.dart';
import 'package:flutter_starter/app/providers/login_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authState = ref.watch(appProvider);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: authState.whenOrNull(
            data: (state) => Text(state.toString()),
            error: (ob, st) => Text('error'),
            loading: () => Text('loading'),
          ),
        ),
      ),
    );
  }
}
