part of 'otp_cubit.dart';

sealed class OtpState {}

final class OtpInitial extends OtpState {}

final class OtpLoading extends OtpState {}

final class OtpFailure extends OtpState {
  final String errMsg;

  OtpFailure({required this.errMsg});
}

final class OtpShowResendButton extends OtpState {}

final class ReSendOtpSuccess extends OtpState {}

final class VerifyOtpSuccess extends OtpState {}
