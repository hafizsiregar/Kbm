import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kbm/core/service/network_info.dart';
import 'package:kbm/features/data/data_sources/faskes/faskes_remote_data_source.dart';
import 'package:kbm/features/data/repositories/faskes/faskes_repository_impl.dart';
import 'package:kbm/features/domain/repositories/faskes/faskes_repository.dart';
import 'package:kbm/features/domain/use_cases/faskes/get_faskes_detail.dart';
import 'package:kbm/features/presentation/providers/faskes_detail_notifier.dart';
import 'package:kbm/features/presentation/providers/faskes_list_notifier.dart';
import 'features/domain/entities/faskes.dart';
import 'features/domain/use_cases/faskes/get_list_faskes.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  
  sl.registerFactory(
    () => Faskes(
      id: sl(), 
      code: sl(), 
      name: sl(), 
      jenisFaskes: sl(),
      telp: sl(),
      address: sl(),
      photoFaskesUrl: sl(), 
      logoFaskesUrl: sl(),)
  );

  sl.registerLazySingleton<FaskesRepository>(() => FaskesRepositoryImpl(
    faskesRemoteDataSource: sl(),
    networkInfo: sl()
  ));
  sl.registerLazySingleton<FaskesRemoteDataSource>(() => FaskesRemoteDataSourceImpl(
    dio: Dio()
  ));
  sl.registerLazySingleton(() => GetListFaskes(repository: sl()));

  //! Connectivity
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => Connectivity());

  //!Providers
  sl.registerFactory(
    () => FaskesDetailNotifier(
      getFaskesDetail: sl()));
  sl.registerLazySingleton(
    () => FaskesListNotifier(getList: sl())
  );

  //! use case
  sl.registerLazySingleton(
    () => GetFaskesDetail(repository: sl()));
}
