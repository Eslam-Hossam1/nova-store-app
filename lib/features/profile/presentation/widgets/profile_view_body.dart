import 'package:flutter/material.dart';
import 'package:nova_store_app/features/profile/presentation/widgets/profile_rounded_app_bar.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        ProfileRoundedAppBar(),
      ],
    );
  }
}
