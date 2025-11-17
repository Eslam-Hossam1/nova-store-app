import 'package:flutter/material.dart';
import 'package:nova_store_app/features/home/presentation/widgets/changable_favourate_icon.dart';

class FavouriteIconButton extends StatefulWidget {
  const FavouriteIconButton({
    super.key,
  });
  @override
  State<FavouriteIconButton> createState() => _FavouriteIconButtonState();
}

class _FavouriteIconButtonState extends State<FavouriteIconButton> {
  late bool isLiked;
  @override
  void initState() {
    isLiked = false;
    super.initState();
  }

  void toggle() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggle();
      },
      child: ChangableFavourateIcon(
        isFavourte: isLiked,
      ),
    );
  }
}
