import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/widgets/spacing/sliver_height_space.dart';
import 'package:nova_store_app/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:nova_store_app/features/home/presentation/manager/home_products_cubit/home_products_cubit.dart';
import 'package:nova_store_app/features/home/presentation/widgets/category_list_builder.dart';
import 'package:nova_store_app/features/home/presentation/widgets/custom_purple_title.dart';
import 'package:nova_store_app/features/home/presentation/widgets/custom_purple_titled_with_see_all.dart';
import 'package:nova_store_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:nova_store_app/features/home/presentation/widgets/home_scrolling_loading_indicator_builder.dart';
import 'package:nova_store_app/features/home/presentation/widgets/home_products_grid_consumer.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late ScrollController _scrollController;

  Future<void> _onRefresh() async {
    await Future.wait([
      context.read<CategoriesCubit>().getCategories(),
      context.read<HomeProductsCubit>().refreshProducts(),
    ]);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.7) {
      context.read<HomeProductsCubit>().fetchMoreProducts();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          HomeAppBar(),
          SliverHeightSpace(height: 20),
          CustomPurpleTitleWithSeeAll(
            title: 'Categories',
          ),
          SliverHeightSpace(height: 16),
          CategoryListBuilder(),
          SliverHeightSpace(height: 32),
          CustomPurpleTitle(
            title: 'Featured',
          ),
          SliverHeightSpace(height: 16),
          HomeProductsGridConsumer(),
          HomeScrollingLoadingIndicatorbuilder(),
        ],
      ),
    );
  }
}
