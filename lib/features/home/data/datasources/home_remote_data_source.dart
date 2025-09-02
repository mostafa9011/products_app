import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../domain/entities/product_entity.dart';
import '../models/product_model/product_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductEntity>> getProducts();
}

class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  final DioConsumer _dioConsumer;

  HomeRemoteDataSourceImp(this._dioConsumer);

  @override
  Future<List<ProductEntity>> getProducts() async {
    final response = await _dioConsumer.get(path: EndPoints.products);

    final products = (response as List).map((json) {
      return ProductModel.fromJson(json);
    }).toList();

    return products;
  }
}
