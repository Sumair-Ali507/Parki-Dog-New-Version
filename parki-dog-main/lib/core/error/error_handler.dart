import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:parki_dog/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error is its an error from response of the api or from dio itself
      failure = _handleError(error);
    } else {
      failure = DataSource.unKnown.getFailure();
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeOut.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.badResponse:
      return DataSource.badResponse.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.noInternetConnection.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.badCertificate.getFailure();
    default:
      return DataSource.unKnown.getFailure();
  }
}

enum DataSource {
  success,
  noContent,
  badResponse,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeOut,
  cacheError,
  noInternetConnection,
  badCertificate,
  unKnown
}

class ResponseCode {
  static const int success = AppInt.i200; // success with data
  static const int noContent = AppInt.i201; // success with no data (no content)
  static const int badResponse = AppInt.i400; // failure api rejected request
  static const int unauthorized =
      AppInt.i401; // failure, user is not authorized
  static const int forbidden = AppInt.i403; // failure api rejected request
  static const int internalServerError =
      AppInt.i500; // failure, crash in server side
  static const int notFound = AppInt.i404; // failure, page not found
  //local status code
  static const int connectTimeOut = -AppInt.i1;
  static const int cancel = -AppInt.i2;
  static const int receiveTimeOut = -AppInt.i3;
  static const int sendTimeOut = -AppInt.i4;
  static const int cacheError = -AppInt.i5;
  static const int noInternetConnection = -AppInt.i6;
  static const int badCertificate = -AppInt.i7;
  static const int unKnown = -AppInt.i8;
}

class ResponseMessage {
  static String success =
      LocaleKeys.errorHandling_successMessage; // success with data
  static String noContent = LocaleKeys
      .errorHandling_successMessage; // success with no data (no content)
  static String badResponse =
      LocaleKeys.errorHandling_badResponseError; // failure api rejected request
  static String unauthorized = LocaleKeys
      .errorHandling_unauthorizedError; // failure, user is not authorized
  static String forbidden =
      LocaleKeys.errorHandling_forbiddenError; // failure api rejected request
  static String internalServerError = LocaleKeys
      .errorHandling_internalServerError; // failure, crash in server side
  static String notFound = LocaleKeys.errorHandling_notFoundError;

  static String connectTimeOut = LocaleKeys.errorHandling_connectTimeOutError;
  static String cancel = LocaleKeys.errorHandling_cancelError;
  static String receiveTimeOut = LocaleKeys.errorHandling_receiveTimeOutError;
  static String sendTimeOut = LocaleKeys.errorHandling_sendTimeOutError;
  static String cacheError = LocaleKeys.errorHandling_cacheError;
  static String noInternetConnection =
      LocaleKeys.errorHandling_noInternetConnectionError;
  static String badCertificate = LocaleKeys.errorHandling_badCertificateError;
  static String unKnown = LocaleKeys.errorHandling_unKnownError;
}

extension DataSourceExtension on DataSource {
  Failure getFailure({String? message}) {
    switch (this) {
      case DataSource.success:
        return Failure(ResponseCode.success, ResponseMessage.success);
      case DataSource.noContent:
        return Failure(ResponseCode.noContent, ResponseMessage.noContent);
      case DataSource.badResponse:
        return Failure(
            ResponseCode.badResponse, message ?? ResponseMessage.badResponse);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorized:
        return Failure(ResponseCode.unauthorized, ResponseMessage.unauthorized);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case DataSource.connectTimeout:
        return Failure(
            ResponseCode.connectTimeOut, ResponseMessage.connectTimeOut);
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return Failure(
            ResponseCode.receiveTimeOut, ResponseMessage.receiveTimeOut);
      case DataSource.sendTimeOut:
        return Failure(ResponseCode.sendTimeOut, ResponseMessage.sendTimeOut);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
      case DataSource.badCertificate:
        return Failure(
            ResponseCode.badCertificate, ResponseMessage.badCertificate);
      case DataSource.unKnown:
        return Failure(ResponseCode.unKnown, ResponseMessage.unKnown);
    }
  }
}

class ApiInternalStatus {
  static const int success = AppInt.i0;
  static const int failure = AppInt.i1;
}
