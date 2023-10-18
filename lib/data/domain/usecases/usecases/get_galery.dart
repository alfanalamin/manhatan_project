import 'package:dartz/dartz.dart';
import 'package:manhatan_project/common/failure.dart';
import 'package:manhatan_project/data/domain/repositories/repositories/galery_repository.dart';
import 'package:manhatan_project/data/models/galery_response.dart';
import 'package:manhatan_project/common/utils.dart';

class GetGalery {
  final GaleryRepository repository;

  GetGalery(this.repository);

  Future<Either<Failure, GaleryResponse>> execute({
    String? page,
  }) async {
    final request = await repository.getAbout();
    if (request.isLeft()) {
      final Failure failure = request.asLeft();
      return Left(failure);
    } else {
      final GaleryResponse data = request.asRight();
      return Right(data);
    }
  }
}
