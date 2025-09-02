import 'package:dartz/dartz.dart';

import '../../../../core/errors/api/safe_execute.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImp(this._remoteDataSource);

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers() async {
    return safeExecute(request: () => _remoteDataSource.getUsers());
  }
}
