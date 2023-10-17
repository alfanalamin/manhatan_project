import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:fk_user_agent/fk_user_agent.dart';
import 'package:manhatan_project/common/configs.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


// import 'package:ua_client_hints/ua_client_hints.dart';

final httpLogger =
    InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
  String headers = "";
  options.headers.forEach((key, value) {
    headers += "| $key: $value";
  });

  Fimber.d('''| [DIO] Request: ${options.method} ${options.uri}
| ${options.data.toString()}
| Headers:\n$headers''');
  handler.next(options); //continue
}, onResponse: (Response response, handler) async {
  Fimber.d(
      "| [DIO] Response [code ${response.statusCode}]: ${response.data.toString()}");
  handler.next(response);
  // return response; // continue
// ignore: deprecated_member_use
}, onError: (DioError error, handler) async {
  Fimber.d("| [DIO] Error: ${error.error}: ${error.response.toString()}");
  handler.next(error); //continue
});

class DioClient {
  // final AppSharedPreferences preferences;
  DioClient();

  Future<Dio> client() async {
    // or new Dio with a BaseOptions instance.
    // String? token = preferences.getToken();
    final userAgent = await FkUserAgent.getPropertyAsync('userAgent');
    var headers = {
      'User-Agent': userAgent,
      'Accept': 'application/json',
    };
    var options = BaseOptions(
      baseUrl: Configs.baseUrl,
      followRedirects: false,
      // will not throw errors
      validateStatus: (status) => true,

      headers: headers,
      contentType: 'multipart/form-data',
    );
    Dio dio = Dio(options);
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
    return dio;
  }
}
