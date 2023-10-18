import 'package:dartz/dartz.dart';
import 'package:manhatan_project/common/failure.dart';
import 'package:manhatan_project/data/datasources/konsultasi_remote_data_source.dart';
import 'package:manhatan_project/data/models/konsultasi_response.dart';

abstract class KonsultasiRepository {
  Future<Either<Failure, KonsultasiResponse>> postKonsultasi(
    String fullName,
    String email,
    String phone,
    String description,
    List<String> images,
    Function(int, int)? onSendProgress,
  );
}

class KonsultasiRepositoryImpl implements KonsultasiRepository {
  final KonsultasiRemoteDataSource remoteDataSource;

  KonsultasiRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, KonsultasiResponse>> postKonsultasi(
    String fullName,
    String email,
    String phone,
    String description,
    List<String> images,
    Function(int count, int total)? onSendProgress,
  ) async {
    try {
      final result = await remoteDataSource.postKonsultasi(
        fullName,
        email,
        phone,
        description,
        images,
        onSendProgress,
      );
      return Right(result);
    } on RequestFailure catch (it) {
      return Left(it);
    }
  }
}
