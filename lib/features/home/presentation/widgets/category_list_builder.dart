import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:nova_store_app/features/home/presentation/manager/categories_cubit/categories_state.dart';
import 'package:nova_store_app/features/home/presentation/widgets/category_list_view.dart';
import 'package:nova_store_app/features/home/presentation/widgets/skeletonizer_category_list_view.dart';

class CategoryListBuilder extends StatelessWidget {
  const CategoryListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
      if (state is CategoriesSuccess) {
        return CategoryListView(
          categories: state.categories,
        );
      } else if (state is CategoriesFailure) {
        return SliverToBoxAdapter(
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              state.message,
              style: AppTextStyles.bold22(context)
                  .copyWith(color: context.mainTextColor),
            ),
          ),
        );
      } else {
        return const SkeletonizerCategoryListView();
      }
    });
  }
}
