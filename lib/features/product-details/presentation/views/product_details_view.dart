import 'package:flutter/material.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const ProductDetailsViewBody(),
      ),
    );
  }
}
