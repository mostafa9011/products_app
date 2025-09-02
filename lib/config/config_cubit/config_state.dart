part of 'config_cubit.dart';

enum ConfigStatus {
  initial,
  themeToggled,
  languageToggled,
}

class ConfigState {
  final ConfigStatus status;

  const ConfigState({required this.status});

  ConfigState copyWith({required ConfigStatus status}) {
    return ConfigState(
      status: status,
    );
  }
}
