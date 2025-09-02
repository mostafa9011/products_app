import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/config_cubit/config_cubit.dart';

class ToggleThemeIcon extends StatelessWidget {
  const ToggleThemeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.brightness_6),
      onPressed: () {
        context.read<ConfigCubit>().toggleTheme();
      },
    );
  }
}
