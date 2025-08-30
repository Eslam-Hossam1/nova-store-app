import 'package:nova_store_app/core/errors/failures.dart';

abstract class ApiFailure extends Failure {
  final String errorCode;
  const ApiFailure(super.errMsg, this.errorCode);
}
