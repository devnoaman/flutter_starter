import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/app/providers/app_provider.dart';
import 'package:flutter_starter/app/states/connectivity_state.dart';
import 'package:flutter_starter/utils/toast.dart';

final connectionProvider =
    StateNotifierProvider<ConnectivityChangeNotifier, MyConnectionState>((ref) {
  var context = ref.read(appProvider).key;
  return ConnectivityChangeNotifier(context.currentContext);
});

class ConnectivityChangeNotifier extends StateNotifier<MyConnectionState> {
  BuildContext? currentContext;
  ConnectivityChangeNotifier([this.currentContext])
      : super(const MyConnectionState.inital()) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      resultHandler(result);
    });
  }

  void resultHandler(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      state = const MyConnectionState.noConnection(
          'you have no internet connection');
    } else if (result == ConnectivityResult.mobile) {
      state = const MyConnectionState.mobile(
          'Currently connected to a cellular network. Please connect to a wifi network!');
    } else if (result == ConnectivityResult.wifi) {
      state = const MyConnectionState.wifi('Connected via wifi network!');
    } else if (result == ConnectivityResult.ethernet) {
      state = const MyConnectionState.ethernet('Connected via wifi network!');
    }
  }

  void showToast(text) {
    MyToast.pushToast(context: currentContext as BuildContext, text: text);
  }
  // void initialLoad() async {
  //   ConnectivityResult connectivityResult =
  //       await (Connectivity().checkConnectivity());
  //   resultHandler(connectivityResult);
  // }
}
