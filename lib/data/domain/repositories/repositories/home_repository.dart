import 'package:dartz/dartz.dart';
import 'package:manhatan_project/common/failure.dart';
import 'package:manhatan_project/data/datasources/home_remote_data_source.dart';
import 'package:manhatan_project/data/models/home_response.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeResponse>> getHome();
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, HomeResponse>> getHome() async {
    try {
      final result = await remoteDataSource.getHome();
      return Right(result);
    } on RequestFailure catch (it) {
      return Left(it);
    }
  }
}
