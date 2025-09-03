import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/features/otp/domain/entities/otp_reason.dart';
import 'package:nova_store_app/features/otp/domain/usecases/send_otp_usecase.dart';
import 'package:nova_store_app/features/otp/domain/usecases/verify_otp_usecase.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final SendOtpUsecase _sendOtpUsecase;
  final VerifyOtpUsecase _verifyOtpUsecase;
  final OtpReason otpReason;
  String pinCode = '';
  OtpCubit({
    required VerifyOtpUsecase verifyOtpUsecase,
    required SendOtpUsecase sendOtpUsecase,
    required this.otpReason,
  })  : _sendOtpUsecase = sendOtpUsecase,
        _verifyOtpUsecase = verifyOtpUsecase,
        super(OtpInitial());

  Future<void> resendVerificationCode() async {
    emit(OtpLoading());
    var otpResult = await _sendOtpUsecase.call(
      SendOtpParams(
        otpReason: otpReason,
      ),
    );
    otpResult.fold(
      (failure) => emit(
        OtpFailure(
          errMsg: failure.errMsg,
        ),
      ),
      (success) => emit(
        ReSendOtpSuccess(),
      ),
    );
  }

  void showResendButton() => emit(OtpShowResendButton());

  Future<void> verfiyVerificationCode() async {
    emit(OtpLoading());
    var otpResult = await _verifyOtpUsecase.call(
      VerifyOtpParams(
        pinCode: pinCode,
        otpReason: otpReason,
      ),
    );

    otpResult.fold(
      (failure) => emit(
        OtpFailure(
          errMsg: failure.errMsg,
        ),
      ),
      (otpResult) async {
        await otpReason.onSuccess(otpResult);
        emit(
          VerifyOtpSuccess(),
        );
      },
    );
  }
}
