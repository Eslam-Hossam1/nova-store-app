import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/di/service_locator.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/features/otp/data/repos/otp_repo_impl.dart';
import 'package:nova_store_app/features/otp/domain/entities/otp_reason.dart';
import 'package:nova_store_app/features/otp/domain/usecases/send_otp_usecase.dart';
import 'package:nova_store_app/features/otp/domain/usecases/verify_otp_usecase.dart';
import 'package:nova_store_app/features/otp/presentation/manager/cubit/otp_cubit.dart';
import 'package:nova_store_app/features/otp/presentation/views/otp_view.dart';

class OtpRoute {
  static GoRoute otp = GoRoute(
      path: RoutePaths.otp,
      builder: (context, state) {
        final OtpReason otpReason = state.extra as OtpReason;
        return BlocProvider(
          create: (context) => OtpCubit(
            sendOtpUsecase: SendOtpUsecase(otpRepo: getIt<OtpRepoImpl>()),
            verifyOtpUsecase: VerifyOtpUsecase(otpRepo: getIt<OtpRepoImpl>()),
            otpReason: otpReason,
          ),
          child: OtpView(),
        );
      });

  static List<GoRoute> routes = [
    otp,
  ];
}
