import 'package:dartz/dartz.dart';
import 'package:manhatan_project/common/failure.dart';
import 'package:manhatan_project/data/domain/repositories/repositories/about_repository.dart';
import 'package:manhatan_project/data/models/about_response.dart';
import 'package:manhatan_project/common/utils.dart';

class GetAbout {
  final AboutRepository repository;

  GetAbout(this.repository);

  Future<Either<Failure, AboutResponse>> execute({
    String? page,
  }) async {
    final request = await repository.getAbout();
    if (request.isLeft()) {
      final Failure failure = request.asLeft();
      return Left(failure);
    } else {
      final AboutResponse data = request.asRight();
      return Right(data);
    }
  }
}
