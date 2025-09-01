import 'package:flutter/material.dart';
import 'package:nova_store_app/features/otp/presentation/views/widgets/otp_view_body.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OtpViewBody(),
    );
  }
}