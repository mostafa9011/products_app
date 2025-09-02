import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/home_repository.dart';

class GetUsersUseCase {
  final HomeRepository _repository;

  GetUsersUseCase(this._repository);

  Future<Either<Failure, List<UserEntity>>> call() {
    return _repository.getUsers();
  }
}
