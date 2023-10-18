import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:manhatan_project/common/app_shared_preferences.dart';
import 'package:manhatan_project/common/configs.dart';
import 'package:manhatan_project/common/dio.dart';
import 'package:manhatan_project/data/datasources/about_remote_data_source.dart';
import 'package:manhatan_project/data/datasources/galery_remote_data_source.dart';
import 'package:manhatan_project/data/datasources/home_remote_data_source.dart';
import 'package:manhatan_project/data/datasources/konsultasi_remote_data_source.dart';
import 'package:manhatan_project/data/datasources/varises_remote_data_source.dart';
import 'package:manhatan_project/data/domain/repositories/repositories/about_repository.dart';
import 'package:manhatan_project/data/domain/repositories/repositories/galery_repository.dart';
import 'package:manhatan_project/data/domain/repositories/repositories/home_repository.dart';
import 'package:manhatan_project/data/domain/repositories/repositories/konsultasi_repository.dart';
import 'package:manhatan_project/data/domain/repositories/repositories/varises_repository.dart';
import 'package:manhatan_project/data/domain/usecases/usecases/get_about.dart';
import 'package:manhatan_project/data/domain/usecases/usecases/get_galery.dart';
import 'package:manhatan_project/data/domain/usecases/usecases/get_home.dart';
import 'package:manhatan_project/data/domain/usecases/usecases/get_varises.dart';
import 'package:manhatan_project/data/domain/usecases/usecases/post_konsultasi.dart';
import 'package:manhatan_project/presentation/providers/about_provider.dart';
import 'package:manhatan_project/presentation/providers/button_provider.dart';
import 'package:manhatan_project/presentation/providers/galery_provider.dart';
import 'package:manhatan_project/presentation/providers/home_provider.dart';
import 'package:manhatan_project/presentation/providers/konsultasi_provider.dart';
import 'package:manhatan_project/presentation/providers/varises_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

void init() {
  locator.allowReassignment = true;
  locator.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  locator.registerLazySingleton<AppSharedPreferences>(
      () => AppSharedPreferences(preferences: locator()));

  // provider
  locator.registerFactory(
    () => HomeProvider(
      getHome: locator(),
    ),
  );
  locator.registerFactory(
    () => ButtonProvider(),
  );
  locator.registerFactory(
    () => VarisesProvider(
      getVarises: locator(),
    ),
  );
  locator.registerFactory(
    () => AboutProvider(
      getAbout: locator(),
    ),
  );
  locator.registerFactory(
    () => GaleryProvider(
      getGalery: locator(),
    ),
  );
  locator.registerFactory(
    () => GaleryProvider(
      getGalery: locator(),
    ),
  );
  locator.registerFactory(
    () => KonsultasiProvider(
      postKonsultasi: locator(),
    ),
  );

  // end provider

  // use case
  locator.registerLazySingleton(() => GetHome(locator()));
  locator.registerLazySingleton(() => GetVarises(locator()));
  locator.registerLazySingleton(() => GetAbout(locator()));
  locator.registerLazySingleton(() => GetGalery(locator()));
  locator.registerLazySingleton(() => PostKonsultasi(locator()));
  // end use case

  // repository implementation
  locator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<VarisesRepository>(
    () => VarisesRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<AboutRepository>(
    () => AboutRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<GaleryRepository>(
    () => GaleryRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<KonsultasiRepository>(
    () => KonsultasiRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );
  // end repository implementation

  // remote data sources
  locator.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl());
  locator.registerLazySingleton<VarisesRemoteDataSource>(
      () => VarisesRemoteDataSourceImpl());
  locator.registerLazySingleton<AboutRemoteDataSource>(
      () => AboutRemoteDataSourceImpl());
  locator.registerLazySingleton<GeleryRemoteDataSource>(
      () => GeleryRemoteDataSourceImpl());
  locator.registerLazySingleton<KonsultasiRemoteDataSource>(
      () => KonsultasiRemoteDataSourceImpl());
  // end remote data sources

  // external
  locator.registerSingletonAsync<Dio>(() => DioClient().client());
  locator.registerLazySingleton(() => Configs());
  // end external
}

Future<void> resetExternal() async {
  final dioClient = await DioClient().client();

  locator.registerLazySingleton<Dio>(() => dioClient);
}
