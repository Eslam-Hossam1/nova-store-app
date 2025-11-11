import 'package:flutter/material.dart';
import 'package:nova_store_app/core/widgets/spacing/sliver_height_space.dart';
import 'package:nova_store_app/features/home/presentation/widgets/catalouge_list_view.dart';
import 'package:nova_store_app/features/home/presentation/widgets/custom_purple_title.dart';
import 'package:nova_store_app/features/home/presentation/widgets/home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        HomeAppBar(),
        SliverHeightSpace(height: 20),
        CustomPurpleTitle(),
        SliverHeightSpace(height: 16),
        CatalogueListView(),
      ],
    );
  }
}
