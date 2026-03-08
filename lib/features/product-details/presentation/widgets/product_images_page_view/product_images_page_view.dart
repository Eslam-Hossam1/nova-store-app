import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/widgets/custom_cached_network_image.dart';
import 'package:nova_store_app/features/product-details/presentation/manager/manager/product_details_cubit/product_details_cubit.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_images_page_view/product_images_page_indicator.dart';

class ProductImagesPageView extends StatefulWidget {
  const ProductImagesPageView({super.key});

  @override
  State<ProductImagesPageView> createState() => _ProductImagesPageViewState();
}

class _ProductImagesPageViewState extends State<ProductImagesPageView> {
  late final ValueNotifier<int> _currentIndexNotifier;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndexNotifier = ValueNotifier<int>(0);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _currentIndexNotifier.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    _currentIndexNotifier.value = index;
  }

  @override
  Widget build(BuildContext context) {
    final images = context.read<ProductDetailsCubit>().productDetailsEntity.images;
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: _onPageChanged,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return CustomCachedNetworkImage(
                url: images[index],
              );
            },
          ),
          Positioned(
            bottom: 20.h,
            left: 0,
            right: 0,
            child: ProductImagesPageIndicator(
              currentIndexNotifier: _currentIndexNotifier,
              itemCount: images.length,
            ),
          ),
        ],
      ),
    );
  }
}
