import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ColoredSvg extends StatelessWidget {
  const ColoredSvg({
    super.key,
    required this.assetImage,
    required this.color,
    required this.width,
  });
  final String assetImage;
  final Color color;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetImage,
      width: width,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
