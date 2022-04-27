import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectionProvider = StateNotifierProvider((ref) {
  return ConnectivityChangeNotifier();
});

class ConnectivityChangeNotifier extends StateNotifier {
  ConnectivityChangeNotifier() : super(null) {
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
      _state = ConnectivityResult.none;
      _pageText = 'يبدو انك غير متصل بشبكة الانترنيت ، يرجى الاتصال اولا ';
    } else if (result == ConnectivityResult.mobile) {
      _svgUrl = 'assets/noWifi.svg';
      _state = ConnectivityResult.mobile;
      _pageText =
          'Currently connected to a celluar network. Please connect to a wifi network!';
    } else if (result == ConnectivityResult.wifi) {
      _svgUrl = 'assets/connected.svg';
      _state = ConnectivityResult.wifi;
      _pageText = 'Connected to a wifi network!';
    }
    notifyListeners();
  }

  void initialLoad() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    resultHandler(connectivityResult);
  }
}
