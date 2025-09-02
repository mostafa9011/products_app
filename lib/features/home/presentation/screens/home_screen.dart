import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/dependency_injection/di.dart';
import '../bloc/home_bloc.dart';
import '../widgets/products_list.dart';
import '../widgets/fav_icon.dart';

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
          actions: const [
            FavIcon(),
          ],
        ),
        body: const ProductsList(),
      ),
    );
  }
}
