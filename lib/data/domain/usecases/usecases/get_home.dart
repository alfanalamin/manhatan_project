import 'package:dartz/dartz.dart';
import 'package:manhatan_project/common/failure.dart';
import 'package:manhatan_project/data/domain/repositories/repositories/home_repository.dart';
import 'package:manhatan_project/data/models/home_response.dart';
import 'package:manhatan_project/common/utils.dart';
class GetHome {
  final HomeRepository repository;

  GetHome(this.repository);

  Future<Either<Failure, HomeResponse>> execute({
    String? page,
  }) async {
    final request = await repository.getHome();
    if (request.isLeft()) {
      final Failure failure = request.asLeft();
      return Left(failure);
    } else {
      final HomeResponse data = request.asRight();
      return Right(data);
    }
  }
}
