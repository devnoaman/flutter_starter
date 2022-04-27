import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/app/providers/connection_provider.dart';

final appProvider = FutureProvider((ref) async {
  var _connectionState = ref.watch(connectionProvider);

  return;
});
