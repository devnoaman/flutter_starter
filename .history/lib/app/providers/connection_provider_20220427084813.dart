import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/app/states/connectivity_state.dart';

final connectionProvider =
    StateNotifierProvider<ConnectivityChangeNotifier, MyConnectionState>((ref) {
  return ConnectivityChangeNotifier();
});

class ConnectivityChangeNotifier extends StateNotifier<MyConnectionState> {
  ConnectivityChangeNotifier() : super(const MyConnectionState.inital()) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      resultHandler(result);
    });
  }

  void resultHandler(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      state = const MyConnectionState.noConnection(
          'يبدو انك غير متصل بشبكة الانترنيت ، يرجى الاتصال اولا ');
    } else if (result == ConnectivityResult.mobile) {
      state = const MyConnectionState.mobile(
          'Currently connected to a celluar network. Please connect to a wifi network!');
    } else if (result == ConnectivityResult.wifi) {
      state = const MyConnectionState.wifi('Connected to a wifi network!');
    } else if (result == ConnectivityResult.ethernet) {
      state = const MyConnectionState.ethernet('Connected to a wifi network!');
    }
  }

  void initialLoad() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    resultHandler(connectivityResult);
  }
}
