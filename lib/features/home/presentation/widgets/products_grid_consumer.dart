import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/features/home/presentation/manager/home_products_cubit/home_products_cubit.dart';
import 'package:nova_store_app/features/home/presentation/manager/home_products_cubit/home_products_state.dart';
import 'package:nova_store_app/features/home/presentation/widgets/products_grid.dart';
import 'package:nova_store_app/features/home/presentation/widgets/skeletonizer_products_grid.dart';

class ProductsGridConsumer extends StatelessWidget {
  const ProductsGridConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeProductsCubit, HomeProductsState>(
        listener: (context, state) {
      if (state is HomeProductsLoadingMoreFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.errorMessage),
          ),
        );
      }
    }, builder: (context, state) {
      if (state is HomeProductsSuccess) {
        return ProductsGrid(
          products: context.read<HomeProductsCubit>().products,
        );
      } else if (state is HomeProductsFirstFetchFailure) {
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
