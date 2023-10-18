import 'package:dartz/dartz.dart';
import 'package:manhatan_project/data/domain/repositories/repositories/konsultasi_repository.dart';
import 'package:manhatan_project/data/models/konsultasi_response.dart';
import 'package:manhatan_project/common/failure.dart';
import 'package:manhatan_project/common/utils.dart';
    

class PostKonsultasi {
  final KonsultasiRepository repository;

  PostKonsultasi(this.repository);

  Future<Either<Failure, KonsultasiResponse>> execute({
    required String fullName,
    required String email,
    required String phone,
    required String description,
    required List<String> images,
    Function(int, int)? onSendProgress,
  }) async {
    final request = await repository.postKonsultasi(
        fullName, email, phone, description, images, onSendProgress);
    if (request.isLeft()) {
      final Failure failure = request.asLeft();
      return Left(failure);
    } else {
      final KonsultasiResponse data = request.asRight();
      return Right(data);
    }
  }
}
