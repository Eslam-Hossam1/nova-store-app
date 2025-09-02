import 'package:nova_store_app/features/otp/domain/entities/otp_result.dart';

abstract interface class OtpReason<T extends OtpResult> {
  final String verifyOtpEndpoint;
  final String sendOtpEndpoint;
  final String email;
  OtpReason({required this.email ,required this.verifyOtpEndpoint, required this.sendOtpEndpoint});
  T resultBuilder(Map<String, dynamic> json);

  void onSuccess(T otpResult);
}
