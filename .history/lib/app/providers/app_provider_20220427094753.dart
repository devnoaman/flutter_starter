import 'package:flutter_riverpod/flutter_riverpod.dart';

final appProvider = FutureProvider((ref) async {
  var _connectionState = ref.watch(connectionProvider);

  return;
});
