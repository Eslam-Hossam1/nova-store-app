import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/widgets/custom_circular_progress_indecator.dart';
import 'package:nova_store_app/core/widgets/spacing/sliver_height_space.dart';
import 'package:nova_store_app/features/product-details/presentation/manager/manager/product_details_cubit/product_details_cubit.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_reviews_sections.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_section/product_details_section.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_header_section.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_images_page_view/product_images_page_view.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/similar_products_section.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});
  static const double _gapBetweenSectionsHeightSpace = 8;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return const Center(child: CustomCircularProgressIndicator());
        }

        if (state is ProductDetailsFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              textAlign: TextAlign.center,
              style: AppTextStyles.bold22(context)
                  .copyWith(color: context.mainTextColor),
            ),
          );
        }

        if (state is ProductDetailsSuccess) {
          return const CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ProductImagesPageView(),
              ),
              ProductHeaderSection(),
              SliverHeightSpace(height: _gapBetweenSectionsHeightSpace),
              ProductDetailsSection(),
              SliverHeightSpace(height: _gapBetweenSectionsHeightSpace),
              ProductDetailsReviewsSection(),
              SliverHeightSpace(height: 32),
              SimilarProductsSection(),
              SliverHeightSpace(height: 100),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
