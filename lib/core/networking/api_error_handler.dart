// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'api_constants.dart';
import 'api_error_model.dart';

enum DataSource {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  //API_LOGIC_ERROR
  DEFAULT
}

class ResponseCode {
  static const int SUCCESS = 200; //success with data
  static const int NO_CONTENT = 201; //success with no data (no content)
  static const int BAD_REQUEST = 400; //failure, API rejected authorised
  static const int UNAUTORISED = 401; //failure, user is notr authorised
  static const int FORBIDDEN = 403; //failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; //failure, crash in server side
  static const int NOT_FOUND = 404; //failure, not found
  static const int API_LOGIC_ERROR = 422; //API , logic ERROR

  //local status code
  static const int CONNECT_TIMEOUE = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String NO_CONTENT = ApiErrors.noContent;
  static const String BAD_REQUEST = ApiErrors.badRequestError;
  static const String FORBIDDEN = ApiErrors.forbiddenError;
  static const String UNAUTORISED = ApiErrors.unauthorizedError;
  static const String NOT_FOUND = ApiErrors.notFoundError;
  static const String INTERNAL_SERVER_ERROR = ApiErrors.internalServerError;
  // local status code
  static const String CONNECT_TIMEOUT = ApiErrors.timeoutError;
  static const String CANCEL = ApiErrors.defaultError;
  static const String RECIEVE_TIMEOUT = ApiErrors.timeoutError;
  static const String SEND_TIMEOUT = ApiErrors.timeoutError;
  static const String CACHE_ERROR = ApiErrors.cacheError;
  static const String NO_INTERNET_CONNECTION = ApiErrors.noInternetError;
  static const String DEFAULT = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.NO_CONTENT:
        return ApiErrorModel(
          /*  error: Error(code: ResponseCode.NO_CONTENT),*/
            message: ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return ApiErrorModel(
        /*  error: Error(code: ResponseCode.BAD_REQUEST),*/
          message: ResponseMessage.BAD_REQUEST,
        );
      case DataSource.CACHE_ERROR:
        return ApiErrorModel(
            message: ResponseMessage.CACHE_ERROR,
        /*    error: Error(code: ResponseCode.CACHE_ERROR)*/);
      case DataSource.CANCEL:
        return ApiErrorModel(
            message: ResponseMessage.CANCEL,
          /*  error: Error(code: ResponseCode.CANCEL)*/);
      case DataSource.CONNECT_TIMEOUT:
        return ApiErrorModel(
            message: ResponseMessage.CONNECT_TIMEOUT,
          /*  error: Error(code: ResponseCode.CONNECT_TIMEOUE)*/);
      case DataSource.DEFAULT:
        return ApiErrorModel(
            message: ResponseMessage.DEFAULT,
          /*  error: Error(code: ResponseCode.DEFAULT)*/);
      case DataSource.FORBIDDEN:
        return ApiErrorModel(
            message: ResponseMessage.FORBIDDEN,
        /*    error: Error(code: ResponseCode.FORBIDDEN)*/);
      case DataSource.INTERNAL_SERVER_ERROR:
        return ApiErrorModel(
            message: ResponseMessage.INTERNAL_SERVER_ERROR,
          /*  error: Error(code: ResponseCode.INTERNAL_SERVER_ERROR)*/);
      case DataSource.NOT_FOUND:
        return ApiErrorModel(
            message: ResponseMessage.NOT_FOUND,
      /*      error: Error(code: ResponseCode.NOT_FOUND)*/);
      case DataSource.NO_INTERNET_CONNECTION:
        return ApiErrorModel(
            message: ResponseMessage.NO_INTERNET_CONNECTION,
      /*      error: Error(code: ResponseCode.NO_INTERNET_CONNECTION)*/);
      case DataSource.RECIEVE_TIMEOUT:
        return ApiErrorModel(
            message: ResponseMessage.RECIEVE_TIMEOUT,
            /*error: Error(code: ResponseCode.RECIEVE_TIMEOUT)*/);
      case DataSource.SEND_TIMEOUT:
        return ApiErrorModel(
            message: ResponseMessage.SEND_TIMEOUT,
          /*  error: Error(code: ResponseCode.SEND_TIMEOUT)*/);
      case DataSource.UNAUTORISED:
        return ApiErrorModel(
            message: ResponseMessage.UNAUTORISED,
            /*error: Error(code: ResponseCode.UNAUTORISED)*/);
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      //dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleError(error);
    } else {
      apiErrorModel = DataSource.DEFAULT.getFailure();
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.DEFAULT.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.DEFAULT.getFailure();
    }
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
