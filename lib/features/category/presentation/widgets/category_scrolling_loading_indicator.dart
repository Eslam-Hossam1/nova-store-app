import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/widgets/sliver_scrolling_loading_indicator.dart';
import 'package:nova_store_app/features/category/presentation/manager/category_products/category_products_cubit.dart';

class CategoryScrollingLoadingIndicator extends StatelessWidget {
  const CategoryScrollingLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
      builder: (context, state) {
        return state is CategoryProductsLoadingMore
            ? SliverScrollingLoadingIndIcator()
            : const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
