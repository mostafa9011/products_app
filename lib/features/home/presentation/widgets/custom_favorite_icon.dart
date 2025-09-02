import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/product_entity.dart';
import '../bloc/home_bloc.dart';

class CustomFavoriteIcon extends StatefulWidget {
  final ProductEntity product;
  final bool isFavoriteScreen;

  const CustomFavoriteIcon({
    required this.product,
    this.isFavoriteScreen = false,
    super.key,
  });

  @override
  State<CustomFavoriteIcon> createState() => _CustomFavoriteIconState();
}

class _CustomFavoriteIconState extends State<CustomFavoriteIcon> {
  final _productBox = Hive.box<ProductEntity>('products');

  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.product.isFavorite;
  }

  @override
  void didUpdateWidget(covariant CustomFavoriteIcon oldWidget) {
    setState(() {
      isFavorite = widget.product.isFavorite;
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    return IconButton(
      onPressed: () {
        if (isFavorite) {
          // remove from favorite
          _productBox.delete(widget.product.id);

          // to control on rebuilds and optomize performance
          if (widget.isFavoriteScreen) {
            bloc.add(
              UpdateProductsEvent(widget.product.copyWith(isFavorite: false)),
            );
          }
        } else {
          // add to favorite
          _productBox.put(
            widget.product.id,
            widget.product.copyWith(isFavorite: true),
          );
        }

        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : null,
      ),
    );
  }
}
