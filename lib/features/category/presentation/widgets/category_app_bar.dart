import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/widgets/custom_purple_gradient_app_bar.dart';

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
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        'Womin Clothes',
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
