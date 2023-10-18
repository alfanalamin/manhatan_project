
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:manhatan_project/common/app_shared_preferences.dart';
import 'package:manhatan_project/common/configs.dart';
import 'package:manhatan_project/common/failure.dart';
import 'package:manhatan_project/common/strings.dart';
import 'package:manhatan_project/data/models/konsultasi_response.dart';

abstract class KonsultasiRemoteDataSource {
  Future<KonsultasiResponse> postKonsultasi(
    String fullName,
    String email,
    String phone,
    String description,
    List<String> images,
    Function(int, int)? onSendProgress,
  );
}

class KonsultasiRemoteDataSourceImpl implements KonsultasiRemoteDataSource {
  @override
  Future<KonsultasiResponse> postKonsultasi(
    String fullName,
    String email,
    String phone,
    String description,
    List<String> images,
    Function(int, int)? onSendProgress,
  ) async {
    try {
      final lang = GetIt.I<AppSharedPreferences>().getLang();
      Map<String, dynamic> map = {};
      map['key'] = Configs.apiKey;
      map['lang'] = lang;
      map['full_name'] = fullName;
      map['email'] = email;
      map['phone'] = phone;
      map['description'] = description;
      for (var i = 0; i < images.length; i++) {
        map['image[$i]'] = MultipartFile.fromFileSync(images[i]);
      }

      final formData = FormData.fromMap(
        map,
      );
      final response = await GetIt.I<Dio>().post(
        '/konsultasi/post',
        data: formData,
        onSendProgress: onSendProgress,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return KonsultasiResponse.fromJson(
            response.data as Map<String, dynamic>);
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
