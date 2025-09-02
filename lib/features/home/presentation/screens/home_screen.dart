import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/page_name.dart';
import '../../../../core/utils/dependency_injection/di.dart';
import '../bloc/home_bloc.dart';
import '../widgets/products_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            Builder(
              builder: (context) {
                final bloc = context.read<HomeBloc>();
                return IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      PageName.favoriteScreen,
                      arguments: bloc,
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: const ProductsList(),
      ),
    );
  }
}
