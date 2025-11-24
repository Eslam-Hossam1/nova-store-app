import 'package:flutter/material.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_bottom_section.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.secondScaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            const ProductDetailsViewBody(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ProductDetailsBottomSection(),
            ),
          ],
        ),
      ),
    );
  }
}
