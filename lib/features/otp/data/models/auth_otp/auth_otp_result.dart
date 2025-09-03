
import 'package:nova_store_app/core/api/api_keys.dart';
import 'package:nova_store_app/features/otp/domain/entities/otp_result.dart';

class AuthOtpResult implements OtpResult {
  final String accessToken;
  final String refreshToken;

  const AuthOtpResult({
    required this.accessToken,
    required this.refreshToken,
  });
  factory AuthOtpResult.fromJson(Map<String, dynamic> json) {
    return AuthOtpResult(
      accessToken: json[ApiKeys.accessToken],
      refreshToken: json[ApiKeys.refreshToken],
    );
  }
}
