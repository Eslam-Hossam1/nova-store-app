import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';
import 'package:nova_store_app/core/usecases/usecase.dart';
import 'package:nova_store_app/features/otp/domain/entities/otp_reason.dart';
import 'package:nova_store_app/features/otp/domain/entities/otp_result.dart';
import 'package:nova_store_app/features/otp/domain/repos/otp_repo.dart';

class SendOtpUsecase implements Usecase<ApiFailure, OtpResult, SendOtpParams> {
  final OtpRepo _otpRepo;

  SendOtpUsecase({required OtpRepo otpRepo}) : _otpRepo = otpRepo;
  @override
  Future<Either<ApiFailure, OtpResult>> call(SendOtpParams params) async {
    return await _otpRepo.sendOtp(
      otpReason: params.otpReason,
    );
  }
}

class SendOtpParams {
  final OtpReason otpReason;

  SendOtpParams({required this.otpReason});
}
