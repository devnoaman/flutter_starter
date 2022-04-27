import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appProvider = ChangeNotifierProvider.autoDispose((ref) {
  return AppState();
});

class AppState extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  GlobalKey<ScaffoldState> get key => _key;
  onTap(int val) {
    _currentTap = val;
    notifyListeners();
  }

  void toggleDrawer() {
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    print(zoomDrawerController.open);
    // notifyListeners();
  }
}
