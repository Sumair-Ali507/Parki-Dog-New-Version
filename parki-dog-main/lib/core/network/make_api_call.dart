import 'package:parki_dog/core/error/error_handler.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/core/network/dio_factory.dart';
import 'package:parki_dog/core/services/service_locator.dart';
import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:dio/dio.dart';

Future<T> makeApiCall<T>({
  required String url,
  required HttpMethod method,
  Map<String, dynamic>? queryParams,
  dynamic body,
  required T Function(dynamic data) fromJson,
}) async {
  final d = await getIt.get<DioFactory>().getDio();

  Response response;
  switch (method) {
    case HttpMethod.get:
      response = await d.get(url, queryParameters: queryParams);
      break;
    case HttpMethod.post:
      response = await d.post(
        url,
        data: body,
        queryParameters: queryParams,
      );
      break;
    case HttpMethod.put:
      response = await d.put(url, data: body, queryParameters: queryParams);
      break;
    case HttpMethod.delete:
      response = await d.delete(url, queryParameters: queryParams);
      break;
    case HttpMethod.patch:
      response = await d.patch(url, data: body, queryParameters: queryParams);
      break;
    default:
      throw ArgumentError('Unsupported HTTP method: $method');
  }
  var statusCode = response.statusCode ?? AppInt.i500;
  if (statusCode >= AppInt.i200 || statusCode <= AppInt.i400) {
    return fromJson(response.data);
  } else {
    throw Failure(
      ApiInternalStatus.failure,
      ResponseMessage.unKnown,
    );
  }
}

enum HttpMethod { get, post, put, delete, patch }
