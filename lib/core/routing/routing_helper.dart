import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/features/otp/domain/entities/otp_reason.dart';

abstract class RoutingHelper {
  static pushOtp(BuildContext context, {required OtpReason otpReason}) {
    context.push(RoutePaths.otp, extra: otpReason);
  }
}
