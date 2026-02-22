import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/features/category/presentation/manager/category_products/category_products_cubit.dart';
import 'package:nova_store_app/features/home/presentation/widgets/products_grid.dart';
import 'package:nova_store_app/features/home/presentation/widgets/skeletonizer_products_grid.dart';

class CategoryProductsGridConsumer extends StatelessWidget {
  const CategoryProductsGridConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryProductsCubit, CategoryProductsState>(
        listener: (context, state) {
      if (state is CategoryProductsLoadingMoreFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.errorMessage),
          ),
        );
      }
    }, builder: (context, state) {
      if (state is CategoryProductsSuccess) {
        return ProductsGrid(
          products: context.read<CategoryProductsCubit>().products,
        );
      } else if (state is CategoryProductsFirstFetchFailure) {
        return SliverToBoxAdapter(
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              state.errorMessage,
              style: AppTextStyles.bold22(context)
                  .copyWith(color: context.mainTextColor),
            ),
          ),
        );
      } else {
        return const SkeletonizerProductsGrid();
      }
    });
  }
}
