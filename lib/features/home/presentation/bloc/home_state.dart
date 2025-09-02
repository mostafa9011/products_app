part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState {
  final HomeStatus status;
  final String? message;
  final List<UserEntity>? users;

  HomeState({
    required this.status,
    this.message,
    this.users,
  });

  HomeState copyWith({
    required HomeStatus status,
    String? message,
    List<UserEntity>? users,
  }) {
    return HomeState(
      status: status,
      message: message ?? this.message,
      users: users ?? this.users,
    );
  }

  bool get isInitial => status == HomeStatus.initial;
  bool get isLoading => status == HomeStatus.loading;
  bool get isSuccess => status == HomeStatus.success;
  bool get isFailure => status == HomeStatus.failure;
}
