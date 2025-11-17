import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double size;
  final Color filledColor;
  final Color emptyColor;

  const StarRating({
    super.key,
    required this.rating,
    this.size = 24.0,
    this.filledColor = Colors.amber,
    this.emptyColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          // Full star
          return Icon(
            Icons.star,
            size: size,
            color: filledColor,
          );
        } else if (index < rating) {
          // Partial star
          return Stack(
            children: [
              Icon(
                Icons.star,
                size: size,
                color: emptyColor,
              ),
              ClipRect(
                clipper: _StarClipper(rating - index),
                child: Icon(
                  Icons.star,
                  size: size,
                  color: filledColor,
                ),
              ),
            ],
          );
        } else {
          // Empty star
          return Icon(
            Icons.star_border,
            size: size,
            color: emptyColor,
          );
        }
      }),
    );
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double fillPercent;

  _StarClipper(this.fillPercent);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width * fillPercent, size.height);
  }

  @override
  bool shouldReclip(_StarClipper oldClipper) {
    return fillPercent != oldClipper.fillPercent;
  }
}
