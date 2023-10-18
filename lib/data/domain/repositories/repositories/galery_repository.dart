import 'package:dartz/dartz.dart';
import 'package:manhatan_project/common/failure.dart';
import 'package:manhatan_project/data/datasources/galery_remote_data_source.dart';
import 'package:manhatan_project/data/models/galery_response.dart';

abstract class GaleryRepository {
  Future<Either<Failure, GaleryResponse>> getAbout();
}

class GaleryRepositoryImpl implements GaleryRepository {
 final GeleryRemoteDataSource remoteDataSource;

  GaleryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, GaleryResponse>> getAbout() async {
    try {
      final result = await remoteDataSource.getAbout();
      return Right(result);
    } on RequestFailure catch (it) {
      return Left(it);
    }
  }
}
