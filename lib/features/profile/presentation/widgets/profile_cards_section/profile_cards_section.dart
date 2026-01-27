import 'package:flutter/material.dart';
import 'package:nova_store_app/core/utils/assets.dart';
import 'package:nova_store_app/core/widgets/spacing/height_space.dart';
import 'package:nova_store_app/features/profile/presentation/models/profile_card_model.dart';
import 'package:nova_store_app/features/profile/presentation/widgets/profile_cards_section/profile_card.dart';

class ProfileCardsSection extends StatefulWidget {
  const ProfileCardsSection({
    super.key,
  });

  @override
  State<ProfileCardsSection> createState() => _ProfileCardsSectionState();
}

class _ProfileCardsSectionState extends State<ProfileCardsSection> {
  final List<ProfileCardModel> profileCardModels = [
    ProfileCardModel(
        svgPath: Assets.imagesSvgsLocation,
        title: "Shipping Addresses",
        onTap: () {}),
    ProfileCardModel(
        svgPath: Assets.imagesSvgsPaymentMethodsIcon,
        title: "Payment Methods",
        onTap: () {}),
    ProfileCardModel(
        svgPath: Assets.imagesSvgsOrdersIcon, title: "Orders", onTap: () {}),
    ProfileCardModel(
        svgPath: Assets.imagesSvgsFavourite, title: "Favourite", onTap: () {}),
    ProfileCardModel(
        svgPath: Assets.imagesSvgsSettings, title: "Settings", onTap: () {}),
    ProfileCardModel(
        svgPath: Assets.imagesSvgsLogout, title: "Logout", onTap: () {}),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList.separated(
        itemCount: profileCardModels.length,
        separatorBuilder: (context, index) {
          return const HeightSpace(height: 16);
        },
        itemBuilder: (context, index) {
          return ProfileCard(profileCardModel: profileCardModels[index]);
        },
      ),
    );
  }
}
