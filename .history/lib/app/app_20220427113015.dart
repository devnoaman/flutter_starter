import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_starter/app/providers/app_provider.dart';
import 'package:flutter_starter/app/providers/connection_provider.dart';
import 'package:flutter_starter/app/providers/login_provider.dart';
import 'package:flutter_starter/providers/theme_provider.dart';
import 'package:flutter_starter/utils/theme_util.dart';
import 'package:flutter_starter/utils/toast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authState = ref.watch(authStateProvider);
    var _connectionState = ref.watch(connectionProvider);
    var app = ref.watch(appProvider);
    final currentTheme = ref.watch(themeProvider);

    // MyToast.pushToast(context: context, text: 'text');
    // _connectionState.whenOrNull(
    //   inital: () => MyToast.pushToast(context: context, text: 'text'),
    // );
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: currentTheme.darkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        key: app.key,
        appBar: AppBar(
          actions: [IconButton(onPressed: () {}, icon: Icon(currentTheme.darkMode?Icons.dark_mode:Icons.light_mode)],
        ),
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
