import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';
import 'package:nova_store_app/features/otp/domain/entities/otp_reason.dart';
import 'package:nova_store_app/features/otp/domain/entities/otp_result.dart';

abstract interface class OtpRepo {
  Future<Either<ApiFailure, OtpResult>> verifyOtp({
    required OtpReason otpReason,
    required String pinCode,
  });
  Future<Either<ApiFailure, void>> sendOtp({
    required OtpReason otpReason,
  });
}
