import 'package:nova_store_app/core/api/api_consumer.dart';
import 'package:nova_store_app/core/api/api_keys.dart';
import 'package:nova_store_app/features/otp/data/data_sources/otp_remote_data_source.dart';
import 'package:nova_store_app/features/otp/domain/entities/otp_reason.dart';
import 'package:nova_store_app/features/otp/domain/entities/otp_result.dart';

class OtpRemoteDataSourceImpl implements OtpRemoteDataSource {
  final ApiConsumer _apiConsumer;

  OtpRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  Future<OtpResult> sendOtp({required OtpReason<OtpResult> otpReason}) async {
    final response = await _apiConsumer.post(
      otpReason.sendOtpEndpoint,
      data: {
        ApiKeys.email: otpReason.email,
      },
    );
    OtpResult otpResult = otpReason.resultBuilder(
      response as Map<String, dynamic>,
    );
    return otpResult;
  }

  @override
  Future<OtpResult> verifyOtp(
      {required OtpReason<OtpResult> otpReason,
      required String pinCode}) async {
    final response = await _apiConsumer.post(
      otpReason.verifyOtpEndpoint,
      data: {
        ApiKeys.email: otpReason.email,
        ApiKeys.code: pinCode,
      },
    );
    OtpResult otpResult = otpReason.resultBuilder(
      response as Map<String, dynamic>,
    );
    return otpResult;
  }
}
