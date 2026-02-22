import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/widgets/spacing/sliver_height_space.dart';
import 'package:nova_store_app/features/category/presentation/manager/category_products/category_products_cubit.dart';
import 'package:nova_store_app/features/category/presentation/widgets/category_app_bar.dart';
import 'package:nova_store_app/features/category/presentation/widgets/category_products_grid_consumer.dart';
import 'package:nova_store_app/features/category/presentation/widgets/category_scrolling_loading_indicator.dart';
import 'package:nova_store_app/features/home/presentation/widgets/custom_purple_title.dart';

class CategoryViewBody extends StatefulWidget {
  const CategoryViewBody({super.key});

  @override
  State<CategoryViewBody> createState() => _CategoryViewBodyState();
}

class _CategoryViewBodyState extends State<CategoryViewBody> {
  late ScrollController _scrollController;

  Future<void> _onRefresh() async {
    await context.read<CategoryProductsCubit>().refreshProducts();
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
      context.read<CategoryProductsCubit>().fetchMoreProducts();
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
          CategoryAppBar(),
          const SliverHeightSpace(height: 24),
          CustomPurpleTitle(
              title:
                  '${context.watch<CategoryProductsCubit>().totalProducts} items'),
          const SliverHeightSpace(height: 16),
          const CategoryProductsGridConsumer(),
          const CategoryScrollingLoadingIndicator(),
        ],
      ),
    );
  }
}
