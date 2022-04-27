import 'package:flutter/material.dart';
import 'package:flutter_starter/app/providers/connection_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var connState = ref.watch(connectionProvider);
    return MaterialApp(
      home: Scaffold(
        body: connState.maybeWhen(orElse: () => Text('else')),
      ),
    );
  }
}
