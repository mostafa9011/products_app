import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../domain/entities/user_entity.dart';
import '../models/user_model/user_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<UserEntity>> getUsers();
}

class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  final DioConsumer _dioConsumer;

  HomeRemoteDataSourceImp(this._dioConsumer);

  @override
  Future<List<UserEntity>> getUsers() async {
    final response = await _dioConsumer.get(path: EndPoints.users);

    final users = (response as List).map((json) {
      return UserModel.fromJson(json);
    }).toList();

    return users;
  }
}
