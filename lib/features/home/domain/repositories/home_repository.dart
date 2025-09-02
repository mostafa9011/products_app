import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/product_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
