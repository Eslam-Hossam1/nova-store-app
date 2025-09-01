import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/features/otp/presentation/views/otp_view.dart';

class OtpRoute {
  static GoRoute otp = GoRoute(
    path: RoutePaths.otp,
    builder: (context, state) => const OtpView(),
  );

  static List<GoRoute> routes = [
    otp,
  ];
}
