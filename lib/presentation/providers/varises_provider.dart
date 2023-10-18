import 'package:flutter/material.dart';
import 'package:manhatan_project/data/domain/usecases/usecases/get_varises.dart';
import 'package:manhatan_project/common/failure.dart';
import 'package:manhatan_project/common/state_enum.dart';
import 'package:manhatan_project/data/models/varises_response.dart';

class VarisesProvider extends ChangeNotifier {
  final GetVarises getVarises;

  VarisesProvider({
    required this.getVarises,
  });

  RequestState varisesState = RequestState.empty;
  VarisesResponse? varisesResponse;
  RequestFailure? varisesFailure;

  Future<void> doGetVarises() async {
    varisesState = RequestState.loading;
    notifyListeners();
    final result = await getVarises.execute();

    result.fold(
      (failure) {
        varisesFailure = failure as RequestFailure?;
        varisesResponse = null;
        varisesState = RequestState.error;
        notifyListeners();
      },
      (data) {
        varisesFailure = null;
        varisesResponse = data;
        varisesState = RequestState.loaded;
        notifyListeners();
      },
    );
  }
}
