import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/themes/app_theme.dart';
import '../../../../core/utils/widgets/spinket_loader.dart';
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
    context.read<HomeBloc>().add(GetUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HomeBloc>().add(GetUsersEvent());
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
          final users = state.users ?? [];
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return ProductCard(product: user);
            },
          );
        },
      ),
    );
  }
}
