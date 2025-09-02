import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../widgets/favorite_products.dart';

class FavoriteScreen extends StatelessWidget {
  final HomeBloc homeBloc;
  const FavoriteScreen({required this.homeBloc, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
          centerTitle: true,
        ),
        body: const FavoriteProducts(),
      ),
    );
  }
}
