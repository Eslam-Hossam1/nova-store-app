import 'package:flutter/material.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/features/profile/presentation/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.secondScaffoldBackgroundColor,
      body: SafeArea(
        child: ProfileViewBody(),
      ),
    );
  }
}
