import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/app/providers/connection_provider.dart';

final appProvider = FutureProvider((ref) async {
  final _connectionState = ref.watch(connectionProvider);

 _connectionState.when(inital: (){}, ethernet: (msg){}, noConnection: noConnection, mobile: mobile, wifi: wifi)
  return;
});
