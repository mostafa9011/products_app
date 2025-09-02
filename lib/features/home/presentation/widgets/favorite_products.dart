import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/product_entity.dart';
import 'product_card.dart';

class FavoriteProducts extends StatelessWidget {
  const FavoriteProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final _productBox = Hive.box<ProductEntity>('products');

    return ValueListenableBuilder<Box<ProductEntity>>(
      valueListenable: _productBox.listenable(),
      builder: (context, box, child) {
        final favoriteProducts =
            box.values.where((product) => product.isFavorite).toList();

        if (favoriteProducts.isEmpty) {
          return const Center(child: Text('No favorite products yet.'));
        }

        return ListView.builder(
          itemCount: favoriteProducts.length,
          itemBuilder: (context, index) {
            final product = favoriteProducts[index];
            return ProductCard(
              product: product,
              isFavoriteScreen: true,
            );
          },
        );
      },
    );
  }
}
