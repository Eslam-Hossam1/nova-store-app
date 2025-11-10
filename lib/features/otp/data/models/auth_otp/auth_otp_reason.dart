import 'package:nova_store_app/core/api/end_points.dart';
import 'package:nova_store_app/core/auth/auth_credentials_manager.dart';
import 'package:nova_store_app/core/di/service_locator.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/features/otp/data/models/auth_otp/auth_otp_result.dart';
import 'package:nova_store_app/features/otp/domain/entities/otp_reason.dart';

class AuthOtpReason implements OtpReason<AuthOtpResult> {
  AuthOtpReason({
    required this.email,
  });

  @override
  final String email;

  @override
  final String sendOtpEndpoint = EndPoints.auth;

  @override
  final String verifyOtpEndpoint = EndPoints.verifyAuthOtp;

  @override
  final String toGoViewPath = RoutePaths.home;

  @override
  AuthOtpResult resultBuilder(Map<String, dynamic> json) =>
      AuthOtpResult.fromJson(json);

  @override
  Future<void> onSuccess(AuthOtpResult otpResult) async {
    await getIt<AuthCredentialsManager>().storeTokens(
      accessToken: otpResult.accessToken,
      refreshToken: otpResult.refreshToken,
    );
  }
}
