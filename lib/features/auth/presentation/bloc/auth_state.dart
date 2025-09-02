part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, success, failure }

class AuthState {
  final AuthStatus status;

  AuthState({required this.status});

  AuthState copyWith({required AuthStatus status}) {
    return AuthState(
      status: status,
    );
  }
}
