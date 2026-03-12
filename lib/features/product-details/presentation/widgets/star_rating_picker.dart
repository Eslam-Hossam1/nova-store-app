import 'package:flutter/material.dart';

class StarRatingPicker extends StatelessWidget {
  const StarRatingPicker(
      {required this.selected, required this.onChanged, super.key});

  final int selected;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (i) {
        final star = i + 1;
        return GestureDetector(
          onTap: () => onChanged(star),
          child: Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Icon(
              star <= selected
                  ? Icons.star_rounded
                  : Icons.star_outline_rounded,
              color: star <= selected
                  ? const Color(0xffFFC107)
                  : Colors.grey.shade400,
              size: 32,
            ),
          ),
        );
      }),
    );
  }
}
