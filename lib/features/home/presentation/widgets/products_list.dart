import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../config/themes/app_theme.dart';
import '../../../../core/utils/widgets/spinket_loader.dart';
import '../../domain/entities/product_entity.dart';
import '../bloc/home_bloc.dart';
import '../dialogs/users_error_dialog.dart';
import 'product_card.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HomeBloc>().add(GetProductsEvent());
      },
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // error state
          if (state.isFailure) {
            if (mounted) {
              // show error dialog
              showUsersErrorDialog(
                context: context,
                message: state.message!,
              );
            }
          }
        },
        builder: (context, state) {
          // loading state
          if (state.isLoading) {
            return const SpinketLoader();
          } else if (state.isFailure) {
            return Center(
              child: Text(
                state.message!,
                style: TextStyles.medium16W500(context).copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }

          // success state
          final products = state.products ?? [];
          final _productsBox =
              Hive.box<ProductEntity>('products').values.toList();

          _productsBox.forEach((favProduct) {
            for (var product in products) {
              if (product.id == favProduct.id) {
                product.isFavorite = true;
                break;
              }
            }
          });

          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return ProductCard(
                key: ValueKey(product.id),
                product: product,
              );
            },
          );
        },
      ),
    );
  }
}
