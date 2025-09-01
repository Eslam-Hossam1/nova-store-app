import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nova_store_app/core/api/network_connection_checker.dart';
import 'package:nova_store_app/core/api/network_connection_checker_impl.dart';
import 'package:nova_store_app/core/di/service_locator.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';

mixin NoInternetMixin<T extends StatefulWidget> on State<T> {
  // abstract getter for flexibility & testability
  NetworkConnectionChecker get internetChecker =>
      getIt<NetworkConnectionCheckerImpl>();

  bool _isInternetAlertOn = false;

  @override
  void initState() {
    super.initState();
    _subscribeToInternetChanges();
  }

  void _subscribeToInternetChanges() {
    internetChecker
        .subscribeToConnectivityStreamChanges(_onConnectivityChanged);
  }

  void _onConnectivityChanged(bool isConnected) {
    log('isConnected : $isConnected');
    if (!isConnected) {
      _showNoInternetBanner();
      _isInternetAlertOn = true;
    } else if (_isInternetAlertOn) {
      _hideCurrentBanner();
      _showBackOnlineBanner();
      _isInternetAlertOn = false;
    }
  }

  void _showNoInternetBanner() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'No Internet Connection',
          style:
              AppTextStyles.semiBold14(context).copyWith(color: Colors.white),
        ),
        showCloseIcon: true,
        duration: const Duration(days: 1),
      ),
    );
  }

  void _showBackOnlineBanner() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          "Yay! You're back online.",
          style:
              AppTextStyles.semiBold14(context).copyWith(color: Colors.white),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _hideCurrentBanner() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  @override
  void dispose() {
    internetChecker.disposeConnectivityStream();
    super.dispose();
  }
}
