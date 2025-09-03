import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nova_store_app/core/helpers/dialog_helper.dart';
import 'package:nova_store_app/features/otp/presentation/manager/cubit/otp_cubit.dart';
import 'package:nova_store_app/features/otp/presentation/views/widgets/otp_view_body.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final otpCubit = context.read<OtpCubit>();
    return BlocConsumer<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is OtpFailure) {
          DialogHelper.showErrorDialog(
            context,
            errorMessage: state.errMsg,
            btnOkOnPress: () {},
          );
          otpCubit.showResendButton();
        } else if (state is VerifyOtpSuccess) {
          context.go(otpCubit.otpReason.toGoViewPath);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is OtpLoading,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: PopScope(
              onPopInvokedWithResult: (didPop, result) {
                if (didPop) return;
                DialogHelper.showCustomExitConfirmationDialog(
                  context,
                );
              },
              child: Scaffold(
                body: OtpViewBody(),
              ),
            ),
          ),
        );
      },
    );
  }
}
