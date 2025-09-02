part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  failure,
  productsUpdated,
}

class HomeState {
  final HomeStatus status;
  final String? message;
  final List<ProductEntity>? products;

  HomeState({
    required this.status,
    this.message,
    this.products,
  });

  HomeState copyWith({
    required HomeStatus status,
    String? message,
    List<ProductEntity>? products,
  }) {
    return HomeState(
      status: status,
      message: message ?? this.message,
      products: products ?? this.products,
    );
  }

  bool get isInitial => status == HomeStatus.initial;
  bool get isLoading => status == HomeStatus.loading;
  bool get isSuccess => status == HomeStatus.success;
  bool get isFailure => status == HomeStatus.failure;
  bool get isProductsUpdated => status == HomeStatus.productsUpdated;
}
