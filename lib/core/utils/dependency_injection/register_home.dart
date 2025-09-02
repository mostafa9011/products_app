import '../../../features/home/data/datasources/home_remote_data_source.dart';
import '../../../features/home/data/repositories/home_repository_imp.dart';
import '../../../features/home/domain/repositories/home_repository.dart';
import '../../../features/home/domain/usecases/get_products_use_case.dart';
import '../../../features/home/presentation/bloc/home_bloc.dart';
import '../../api/dio_consumer.dart';
import 'di.dart';

void registerHome() {
  // register home remote data source
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImp(getIt<DioConsumer>()),
  );

  // register home repository
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImp(getIt<HomeRemoteDataSource>()),
  );

  // register home use cases
  getIt
      .registerLazySingleton(() => GetProductsUseCase(getIt<HomeRepository>()));

  // register home bloc
  getIt.registerFactory(() => HomeBloc(getIt<GetProductsUseCase>()));
}
