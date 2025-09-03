import 'package:nova_store_app/features/otp/domain/entities/otp_reason.dart';
import 'package:nova_store_app/features/otp/domain/entities/otp_result.dart';

abstract interface class OtpRemoteDataSource {
  Future<OtpResult> verifyOtp({required OtpReason otpReason,required String pinCode,});
  Future<void> sendOtp({required OtpReason otpReason});
}
