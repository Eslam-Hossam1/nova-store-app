import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/utils/assets.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.url,
    this.placeHolder,
    this.width,
    this.height,
    this.onLoadingComplete,
  });
  final VoidCallback? onLoadingComplete;
  final String url;
  final Widget? placeHolder;
  final double? width;
  final double? height;
  
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      width: width,
      height: height,
      imageUrl: url,
      placeholder: (context, url) =>
          placeHolder ??
          Container(
            color: context.cachedNetworkImagePlaceholderColor,
          ),
      errorWidget: (context, url, error) => Image.asset(
        Assets.imagesJpgsImagePlaceholder,
        fit: BoxFit.cover,
      ),
      imageBuilder: (context, imageProvider) {
        // Call the callback when image is loaded
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onLoadingComplete?.call();
        });
        return Image(
          image: imageProvider,
          fit: BoxFit.cover,
          width: width,
          height: height,
        );
      },
    );
  }
}

