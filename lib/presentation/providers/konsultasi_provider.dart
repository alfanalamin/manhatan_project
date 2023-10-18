import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manhatan_project/common/failure.dart';
import 'package:manhatan_project/data/domain/usecases/usecases/post_konsultasi.dart';
import 'package:manhatan_project/presentation/components/common/image_picker_helper.dart';

class KonsultasiProvider extends ChangeNotifier {
  final PostKonsultasi postKonsultasi;
  KonsultasiProvider({
    Key? key,
    required this.postKonsultasi,
  });

  final _picker = ImagePicker();
  List<String>? images;
  void addImage(String path) {
    Fimber.d(path);
    images ??= [];
    images?.add(path);
    notifyListeners();
  }

  void deleteImage(int index) {
    images?.removeAt(index);
    notifyListeners();
  }

  Future<void> pickImageLostData(
    ValueChanged<String?> onPick,
  ) async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      onPick(null);
      return;
    }
    if (response.file != null) {
      final imagePath = await getImagePath(response.file!);
      onPick(imagePath);
    } else {
      onPick(null);
    }
  }

  Future<void> pickImageGallery(
    ValueChanged<String?> onPick,
  ) async {
    //imagePath = null;
    // Pick an image
    final XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (image != null) {
      final imagePath = await getImagePath(image);
      onPick(imagePath);
    } else {
      onPick(null);
    }
  }

  Future<void> pickImageCamera(
    ValueChanged<String?> onPick,
  ) async {
    //imagePath = null;
    // Pick an image
    final XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      final imagePath = await getImagePath(image);
      onPick(imagePath);
    } else {
      onPick(null);
    }
  }

  final textFullName = TextEditingController();
  final textEmail = TextEditingController();
  final textDescription = TextEditingController();
  final textPhone = TextEditingController();
  Future<void> doPostKonsultasi({
    VoidCallback? onSuccess,
    Function(RequestFailure)? onFailure,
    Function(int, int)? onSendProgress,
  }) async {
    final result = await postKonsultasi.execute(
      fullName: textFullName.text,
      email: textEmail.text,
      phone: textPhone.text,
      description: textDescription.text,
      images: images ?? [],
      onSendProgress: onSendProgress,
    );

    result.fold(
      (failure) {
        onFailure?.call(failure as RequestFailure);
      },
      (data) {
        onSuccess?.call();
      },
    );
  }
}
