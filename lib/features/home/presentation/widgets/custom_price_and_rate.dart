import 'package:flutter/material.dart';

import '../../../../config/themes/app_theme.dart';
import '../../domain/entities/product_entity.dart';

class CustomPriceAndRate extends StatelessWidget {
  final ProductEntity product;

  const CustomPriceAndRate({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${product.price}',
          style: TextStyles.bold16W700(context),
        ),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(width: 4),
            Text(
              product.rating.rate.toString(),
              style: TextStyles.regular14W400(context),
            ),
          ],
        ),
      ],
    );
  }
}

