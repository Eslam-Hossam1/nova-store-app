import 'package:flutter/material.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/features/category/presentation/widgets/category_view_body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.secondScaffoldBackgroundColor,
      body: SafeArea(
        child: CategoryViewBody(),
      ),
    );
  }
}
