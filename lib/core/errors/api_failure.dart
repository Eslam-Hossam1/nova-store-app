
import 'package:nova_store_app/core/errors/network_failure.dart';

abstract class ApiFailure extends NetworkFailure {
  final String errorCode;
  const ApiFailure(super.errMsg, this.errorCode);
}
