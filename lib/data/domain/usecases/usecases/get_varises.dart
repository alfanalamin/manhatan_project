import 'package:dartz/dartz.dart';
import 'package:manhatan_project/common/failure.dart';
import 'package:manhatan_project/data/domain/repositories/repositories/varises_repository.dart';
import 'package:manhatan_project/data/models/varises_response.dart';
import 'package:manhatan_project/common/utils.dart';

class GetVarises {
  final VarisesRepository repository;

  GetVarises(this.repository);

  Future<Either<Failure, VarisesResponse>> execute({
    String? page,
  }) async {
    final request = await repository.getVarises();
    if (request.isLeft()) {
      final Failure failure = request.asLeft();
      return Left(failure);
    } else {
      final VarisesResponse data = request.asRight();
      return Right(data);
    }
  }
}