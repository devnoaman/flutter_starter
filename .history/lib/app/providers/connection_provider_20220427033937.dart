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
  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  String _svgUrl = 'assets/serverDown.svg';
  String _pageText =
      'Currently connected to no network. Please connect to a wifi network!';
  ConnectivityResult _state = ConnectivityResult.none;
  ConnectivityResult get connectivity => _connectivityResult;
  String get svgUrl => _svgUrl;
  String get pageText => _pageText;

  void resultHandler(ConnectivityResult result) {
    _connectivityResult = result;
    if (result == ConnectivityResult.none) {
      _svgUrl = 'assets/serverDown.svg';
      state = const MyConnectionState.noConnection(
          'يبدو انك غير متصل بشبكة الانترنيت ، يرجى الاتصال اولا ');
    } else if (result == ConnectivityResult.mobile) {
      _svgUrl = 'assets/noWifi.svg';
      state = MyConnectionState.mobile(
          'Currently connected to a celluar network. Please connect to a wifi network!');
      _pageText =
          'Currently connected to a celluar network. Please connect to a wifi network!';
    } else if (result == ConnectivityResult.wifi) {
      _svgUrl = 'assets/connected.svg';
      state = MyConnectionState.wifi('Connected to a wifi network!');
      _pageText = 'Connected to a wifi network!';
    }
  }

  void initialLoad() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    resultHandler(connectivityResult);
  }
}
