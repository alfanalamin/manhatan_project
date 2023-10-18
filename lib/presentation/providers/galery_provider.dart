import 'package:flutter/material.dart';
import 'package:manhatan_project/common/failure.dart';
import 'package:manhatan_project/common/state_enum.dart';
import 'package:manhatan_project/data/domain/usecases/usecases/get_galery.dart';
import 'package:manhatan_project/data/models/galery_response.dart';

class GaleryProvider extends ChangeNotifier {
  final GetGalery getGalery;

  GaleryProvider({
    required this.getGalery,
  });

  RequestState galeryState = RequestState.empty;
  GaleryResponse? galeryResponse;
  RequestFailure? galeryFailure;

  Future<void> doGetGalery() async {
    galeryState = RequestState.loading;
    notifyListeners();
    final result = await getGalery.execute();

    result.fold(
      (failure) {
        print('Kesalahan: $failure');
        galeryFailure = failure as RequestFailure?;
        galeryResponse = null;
        galeryState = RequestState.error;
        notifyListeners();
      },
      (data) {
        galeryFailure = null;
        galeryResponse = data;
        galeryState = RequestState.loaded;
        notifyListeners();
      },
    );
  }
}
