abstract interface class NetworkConnectionChecker {
  Future<bool> isConnected();

  void subscribeToConnectivityStreamChanges(
    void Function(bool isConnected) onConnectivityChange,
  );

  void disposeConnectivityStream();
}
