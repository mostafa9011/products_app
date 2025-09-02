import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class CustomFavoriteIcon extends StatelessWidget {
  const CustomFavoriteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return FavoriteButton(
      valueChanged: (value) {},
      iconSize: 40,
    );
  }
}
