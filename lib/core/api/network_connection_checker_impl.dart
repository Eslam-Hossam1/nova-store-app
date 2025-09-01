import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nova_store_app/core/api/network_connection_checker.dart';

class NetworkConnectionCheckerImpl implements NetworkConnectionChecker {
  final Connectivity _connectivity;

  NetworkConnectionCheckerImpl({required Connectivity connectivity})
      : _connectivity = connectivity;
  @override
  Future<bool> isConnected() async {
    final List<ConnectivityResult> status =
        await _connectivity.checkConnectivity();
    return isConnectedWithMobileDataOrWifi(status);
  }

  // will be used to hold stream to cancel it in dispose method
  late StreamSubscription _connectivityStream;

  @override
  void subscribeToConnectivityStreamChanges(
      void Function(bool isConnected) onConnectivityChange) async {
    _connectivityStream = _connectivity.onConnectivityChanged.listen(
      (status) {
        bool isConnected = isConnectedWithMobileDataOrWifi(status);
        onConnectivityChange(isConnected);
      },
    );
  }

  bool isConnectedWithMobileDataOrWifi(List<ConnectivityResult> status) {
    return status.contains(ConnectivityResult.mobile) ||
        status.contains(ConnectivityResult.wifi);
  }

  @override
  void disposeConnectivityStream() => _connectivityStream.cancel();
}
