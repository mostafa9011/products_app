import 'package:bloc/bloc.dart';

import '../../../../core/utils/functions/kprint.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_products_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProductsUseCase _getUsersUseCase;

  HomeBloc(this._getUsersUseCase)
      : super(HomeState(status: HomeStatus.initial)) {
    on<GetProductsEvent>((event, emit) async {
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
        (products) {
          emit(state.copyWith(status: HomeStatus.success, products: products));
        },
      );
    });

    on<UpdateProductsEvent>((event, emit) async {
      final updatedProducts = state.products?.map((product) {
        if (product.id == event.product.id) {
          product = event.product;
          kprint('Product favorite become : ${product.isFavorite}');
        }
        return product;
      }).toList();

      emit(
        state.copyWith(
          status: HomeStatus.productsUpdated,
          products: updatedProducts,
        ),
      );
    });
  }
}
