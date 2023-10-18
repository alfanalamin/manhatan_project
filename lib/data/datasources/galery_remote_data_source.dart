import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:manhatan_project/common/app_shared_preferences.dart';
import 'package:manhatan_project/common/configs.dart';
import 'package:manhatan_project/common/failure.dart';
import 'package:manhatan_project/common/strings.dart';
import 'package:manhatan_project/data/models/galery_response.dart';

abstract class GeleryRemoteDataSource {
  Future<GaleryResponse> getAbout();
}

class GeleryRemoteDataSourceImpl implements GeleryRemoteDataSource {
  @override
  Future<GaleryResponse> getAbout() async {
    try {
      final lang = GetIt.I<AppSharedPreferences>().getLang();
      Map<String, dynamic> map = {};
      map['key'] = Configs.apiKey;
      map['lang'] = lang;
      var formData = FormData.fromMap(map);
      final response = await GetIt.I<Dio>().post(
        '/gallery',
        data: formData,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GaleryResponse.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw RequestFailure(
          response.statusCode ?? -1,
          response.data['message'] ?? "",
        );
      }
    } on DioException {
      throw RequestFailure(
        -1,
        Strings.notConnected,
      );
    }
  }
}
