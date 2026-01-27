import 'package:flutter/material.dart';
import 'package:nova_store_app/core/widgets/spacing/sliver_height_space.dart';
import 'package:nova_store_app/features/profile/presentation/widgets/profile_cards_section/profile_cards_section.dart';
import 'package:nova_store_app/features/profile/presentation/widgets/profile_app_bar/profile_rounded_app_bar.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        ProfileRoundedAppBar(),
        SliverHeightSpace(height: 24),
        ProfileCardsSection()
      ],
    );
  }
}
