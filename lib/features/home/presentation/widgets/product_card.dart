import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/app_theme.dart';
import '../../domain/entities/product_entity.dart';
import 'custom_favorite_icon.dart';
import 'custom_price_and_rate.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final bool isFavoriteScreen;

  const ProductCard({
    required this.product,
    this.isFavoriteScreen = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomFavoriteIcon(
              product: product,
              isFavoriteScreen: isFavoriteScreen,
            ),
            Align(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  height: 150.h,
                  width: 150.w,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.title,
              style: TextStyles.bold16W700(context),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: TextStyles.regular14W400(context),
              maxLines: 3,
            ),
            const SizedBox(height: 8),
            CustomPriceAndRate(product: product),
          ],
        ),
      ),
    );
  }
}
