import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/config_cubit/config_cubit.dart';

class FavIcon extends StatelessWidget {
  const FavIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.favorite),
      onPressed: () {
        context.read<ConfigCubit>().toggleTheme();
      },
    );
  }
}
