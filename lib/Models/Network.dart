import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Network extends ChangeNotifier {
  bool isConnected = false;
  initConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      isConnected = true;
      print("Connected!");
    }
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        isConnected = false;
        notifyListeners();
        print("Disconnected!");
      } else {
        isConnected = true;
        notifyListeners();
        print("Connected!");
      }
    });
  }
}
