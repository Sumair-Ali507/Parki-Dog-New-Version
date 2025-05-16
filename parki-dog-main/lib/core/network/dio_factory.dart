import 'package:parki_dog/core/helpers/app_preferences.dart';
import 'package:parki_dog/core/network/network_constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = 'application/json';
const String contentType = 'content-type';
const String accept = 'accept';
const String authorization = 'authorization';
const String defaultLanguage = 'language';

class DioFactory {
  final AppPreferences _appPreferences;

  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    // String language=await _appPreferences.getAppLanguage();
    String? token =
        await _appPreferences.getSecuredString(userToken); // Retrieve the token

    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      if (token.isNotEmpty) authorization: 'Bearer $token',
      // authorization: 'Bearer ${NetworkConstants.token}',
      // defaultLanguage: language // get it from app prefs
    };

    dio.options = BaseOptions(
        // queryParameters: {
        //   'lang':language
        // },
        baseUrl: NetworkConstants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: headers,
        receiveTimeout:
            const Duration(milliseconds: NetworkConstants.apiTimeOut),
        sendTimeout: const Duration(milliseconds: NetworkConstants.apiTimeOut));

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true, requestBody: true, responseHeader: true));
    return dio;
  }
}
