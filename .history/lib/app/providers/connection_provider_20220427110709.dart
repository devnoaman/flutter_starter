import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/app/providers/app_provider.dart';
import 'package:flutter_starter/app/states/connectivity_state.dart';
import 'package:flutter_starter/utils/toast.dart';

final connectionProvider =
    StateNotifierProvider<ConnectivityChangeNotifier, MyConnectionState>((ref) {
  var context = ref.read(appProvider);
  return ConnectivityChangeNotifier(context);
});

class ConnectivityChangeNotifier extends StateNotifier<MyConnectionState> {
  AppState? currentContext;
  ConnectivityChangeNotifier([this.currentContext])
      : super(const MyConnectionState.inital()) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      resultHandler(result);
    });
  }

  void resultHandler(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      showToast('you have no internet connection');
      state = const MyConnectionState.noConnection(
          'you have no internet connection');
    } else if (result == ConnectivityResult.mobile) {
      showToast(
          'Currently connected to a cellular network. Please connect to a wifi network!');

      state = const MyConnectionState.mobile(
          'Currently connected to a cellular network. Please connect to a wifi network!');
    } else if (result == ConnectivityResult.wifi) {
      showToast('Connected via wifi network!');

      state = const MyConnectionState.wifi('Connected via wifi network!');
    } else if (result == ConnectivityResult.ethernet) {
      showToast('Connected via ethernet network!');
      state =
          const MyConnectionState.ethernet('Connected via ethernet network!');
    }
  }

  void showToast(text) {
    MyToast.pushToast(
        context: currentContext!.key.currentContext as BuildContext,
        text: text);
  }
  // void initialLoad() async {
  //   ConnectivityResult connectivityResult =
  //       await (Connectivity().checkConnectivity());
  //   resultHandler(connectivityResult);
  // }
}
