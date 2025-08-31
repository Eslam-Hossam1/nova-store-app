import 'package:nova_store_app/core/errors/network_failure.dart';

class NoInternetConnectionFailure extends NetworkFailure {
  const NoInternetConnectionFailure([super.errMsg = "No Internet Connection"]);
}
