import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/widgets/custom_purple_gradient_app_bar.dart';
import 'package:nova_store_app/features/category/presentation/manager/category_products/category_products_cubit.dart';

class CategoryAppBar extends StatelessWidget {
  const CategoryAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPurpleGradientAppBar(
      leadingWidget: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.white,
        ),
      ),
      centerWidget: Text(
        context.read<CategoryProductsCubit>().categoryEntity.name,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: AppTextStyles.bold19(context).copyWith(
          color: Colors.white,
        ),
      ),
      trailingWidget: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.filter_list,
          color: Colors.white,
        ),
      ),
    );
  }
}
