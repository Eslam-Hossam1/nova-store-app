import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:nova_store_app/features/home/presentation/manager/category_cubit/category_state.dart';
import 'package:nova_store_app/features/home/presentation/widgets/catalouge_list_view.dart';
import 'package:nova_store_app/features/home/presentation/widgets/skeletonizer_catalogue_list_view.dart';

class CatalougeListBuilder extends StatelessWidget {
  const CatalougeListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
      if (state is CategorySuccess) {
        return CatalogueListView(
          categories: state.categories,
        );
      } else if (state is CategoryFailure) {
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
        return const SkeletonizerCatalogueListView();
      }
    });
  }
}
