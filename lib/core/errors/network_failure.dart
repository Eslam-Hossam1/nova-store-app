import 'dart:developer';

import 'package:nova_store_app/core/errors/failures.dart';

class NetworkFailure extends Failure {
  const NetworkFailure(super.errMsg);
  factory NetworkFailure.unknown({
    required String unKnownExceptionMsg,
    String errMsg = "UnKnown Error",
  }) {
    log("UnKnownFailure: $unKnownExceptionMsg");
    return NetworkFailure(
      errMsg,
    );
  }
}
