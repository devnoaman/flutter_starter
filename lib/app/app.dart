import 'package:flutter/material.dart';
import 'package:flutter_starter/app/providers/app_provider.dart';
import 'package:flutter_starter/app/providers/connection_provider.dart';
import 'package:flutter_starter/app/providers/language_provider.dart';
import 'package:flutter_starter/app/providers/login_provider.dart';
import 'package:flutter_starter/app/states/auth_state.dart';
import 'package:flutter_starter/gen/assets.gen.dart';
import 'package:flutter_starter/providers/theme_provider.dart';
import 'package:flutter_starter/utils/theme_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authState = ref.watch(authStateProvider);
    var _connectionState = ref.watch(connectionProvider);
    var app = ref.watch(appProvider);
    final currentTheme = ref.watch(themeProvider);
    var trans = AppLocalizations.of(context);
    // MyToast.pushToast(context: context, text: 'text');
    // _connectionState.whenOrNull(
    //   inital: () => MyToast.pushToast(context: context, text: 'text'),
    // );
    final language = ref.watch(lang);

    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line

        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('ar', ''), // arabic, no country code
      ],

      theme: AppTheme.lightTheme,
      locale: language,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appName,
      darkTheme: AppTheme.darkTheme,
      themeMode: currentTheme.maybeWhen(
          light: () => ThemeMode.light,
          dark: () => ThemeMode.dark,
          orElse: () => ThemeMode.system),
      // themeMode: currentTheme,
      // themeMode: currentTheme.darkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(app: app, trans: trans, authState: authState),
    );
  }
}

class HomePage extends HookConsumerWidget {
  const HomePage({
    Key? key,
    required this.app,
    required this.trans,
    required this.authState,
  }) : super(key: key);

  final AppState app;
  final AppLocalizations? trans;
  final AuthState authState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authState = ref.watch(authStateProvider);
    var _connectionState = ref.watch(connectionProvider);
    var app = ref.watch(appProvider);
    final currentTheme = ref.watch(themeProvider);
    var trans = AppLocalizations.of(context);
    final language = ref.watch(lang);

    return Scaffold(
      key: app.key,
      appBar: AppBar(
        title: Text((trans != null) ? trans.appName : "AppName"),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(lang.notifier).toggleLocale();
              },
              icon: Icon(Icons.abc_outlined)),

          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                onTap: () {
                  ref.read(themeProvider.notifier).themeState(ThemeMode.light);
                },
                child: ListTile(
                  // leading: Icon(Icons.add),
                  title: Text('light'),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  ref.read(themeProvider.notifier).themeState(ThemeMode.dark);
                },
                child: ListTile(
                  // leading: Icon(Icons.anchor),
                  title: Text('dark'),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  ref.read(themeProvider.notifier).themeState(ThemeMode.system);
                },
                child: ListTile(
                  leading: Assets.images.thisImage.image(),
                  title: Text('system'),
                ),
              ),
            ],
          ),
          //   IconButton(
          //       onPressed: () {
          //         currentTheme.toggleTheme();
          //       },
          //       icon: Icon(
          //           currentTheme.darkMode ? Icons.dark_mode : Icons.light_mode))
        ],
      ),
      body: Center(
        child: authState.whenOrNull(
          initial: () => Text('init'),
          authenticated: () => Text('authenticated'),
          notAuthenticated: (msg) => Text('notAuthenticated'),
        ),
      ),
    );
  }
}
