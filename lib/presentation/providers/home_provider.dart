import 'package:flutter/foundation.dart';
import 'package:manhatan_project/common/failure.dart';
import 'package:manhatan_project/common/state_enum.dart';
import 'package:manhatan_project/data/domain/usecases/usecases/get_home.dart';
import 'package:manhatan_project/data/models/home_response.dart';

class HomeProvider extends ChangeNotifier {
  final GetHome getHome;

  HomeProvider({
    required this.getHome,
  });

  RequestState homeState = RequestState.empty;
  HomeResponse? homeResponse;
  RequestFailure? homeFailure;

  Future<void> doGetHome() async {
    homeState = RequestState.loading;
    notifyListeners();
    final result = await getHome.execute();

    result.fold(
      (failure) {
        homeFailure = failure as RequestFailure?;
        homeResponse = null;
        homeState = RequestState.error;
        notifyListeners();
      },
      (data) {
        homeFailure = null;
        homeResponse = data;
        homeState = RequestState.loaded;
        notifyListeners();
      },
    );
  }
}
