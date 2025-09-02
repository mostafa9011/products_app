part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetProductsEvent extends HomeEvent {}

class UpdateProductsEvent extends HomeEvent {
  final ProductEntity product;

  UpdateProductsEvent(this.product);
}
