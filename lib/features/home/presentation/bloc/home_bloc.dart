import 'package:bloc/bloc.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_users_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUsersUseCase _getUsersUseCase;

  HomeBloc(this._getUsersUseCase)
      : super(HomeState(status: HomeStatus.initial)) {
    on<GetUsersEvent>((event, emit) async {
      emit(state.copyWith(status: HomeStatus.loading));

      final result = await _getUsersUseCase();

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              status: HomeStatus.failure,
              message: failure.message,
            ),
          );
        },
        (users) {
          emit(state.copyWith(status: HomeStatus.success, users: users));
        },
      );
    });
  }
}
