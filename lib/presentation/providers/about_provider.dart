import 'package:flutter/material.dart';
import 'package:manhatan_project/common/failure.dart';
import 'package:manhatan_project/common/state_enum.dart';
import 'package:manhatan_project/data/domain/usecases/usecases/get_about.dart';
import 'package:manhatan_project/data/models/about_response.dart';

class AboutProvider extends ChangeNotifier {
  final GetAbout getAbout;

  AboutProvider({
    required this.getAbout,
  });

  RequestState aboutState = RequestState.empty;
  AboutResponse? aboutResponse;
  RequestFailure? aboutFailure;

  Future<void> doGetAbout() async {
    aboutState = RequestState.loading;
    notifyListeners();
    final result = await getAbout.execute();

    result.fold(
      (failure) {
        print('Kesalahan: $failure');
        aboutFailure = failure as RequestFailure?;
        aboutResponse = null;
        aboutState = RequestState.error;
        notifyListeners();
      },
      (data) {
        aboutFailure = null;
        aboutResponse = data;
        aboutState = RequestState.loaded;
        notifyListeners();
      },
    );
  }
}
