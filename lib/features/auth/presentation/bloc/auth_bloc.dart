import 'package:bloc/bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState(status: AuthStatus.initial)) {
    on<Login>((event, emit) {
      emit(state.copyWith(status: AuthStatus.loading));
    });
  }
}
