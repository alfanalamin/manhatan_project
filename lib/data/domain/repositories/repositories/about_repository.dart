import 'package:dartz/dartz.dart';
import 'package:manhatan_project/common/failure.dart';
import 'package:manhatan_project/data/datasources/about_remote_data_source.dart';
import 'package:manhatan_project/data/models/about_response.dart';

abstract class AboutRepository {
  Future<Either<Failure, AboutResponse>> getAbout();
}

class AboutRepositoryImpl implements AboutRepository {
  final AboutRemoteDataSource remoteDataSource;

  AboutRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, AboutResponse>> getAbout() async {
    try {
      final result = await remoteDataSource.getAbout();
      return Right(result);
    } on RequestFailure catch (it) {
      return Left(it);
    }
  }
}