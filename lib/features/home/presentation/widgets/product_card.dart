import 'package:flutter/material.dart';

import '../../../../config/themes/app_theme.dart';
import '../../domain/entities/product_entity.dart';
import 'custom_user_data_row.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({required this.product, super.key});

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
            Text(
              product.title,
              style: TextStyles.bold16W700(context),
            ),
            const SizedBox(height: 8),
            CustomUserDataRow(
              icon: Icons.email,
              text: product.description,
            ),
            const SizedBox(height: 8),
            CustomUserDataRow(
              icon: Icons.phone,
              text: product.category,
            ),
            const SizedBox(height: 8),
            CustomUserDataRow(
              icon: Icons.location_on,
              text: product.price.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
