import 'package:dartz/dartz.dart';
import 'package:manhatan_project/common/failure.dart';
import 'package:manhatan_project/data/datasources/varises_remote_data_source.dart';
import 'package:manhatan_project/data/models/varises_response.dart';

abstract class VarisesRepository {
  Future<Either<Failure, VarisesResponse>> getVarises();
}

class VarisesRepositoryImpl implements VarisesRepository {
  final VarisesRemoteDataSource remoteDataSource;

  VarisesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, VarisesResponse>> getVarises() async {
   try{
      final result = await remoteDataSource.getVarises();
      return Right(result);
    } on RequestFailure catch (it) {
      return Left(it);
   }
  }
}