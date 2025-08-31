import 'dart:developer';

import 'package:nova_store_app/core/errors/api_error_model/api_error_model.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';
import 'package:dio/dio.dart';
import 'package:nova_store_app/core/errors/error_codes.dart';

class DioApiFailure extends ApiFailure {
  DioApiFailure(
    super.errMsg,
    super.errorCode,
  );

  factory DioApiFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return DioApiFailure(
            "Connection timeout with ApiServer", ErrorCodes.connectionTimeout);
      case DioExceptionType.sendTimeout:
        return DioApiFailure(
            "Send timeout with ApiServer", ErrorCodes.sendTimeout);

      case DioExceptionType.receiveTimeout:
        return DioApiFailure(
            "Receive timeout with ApiServer", ErrorCodes.receiveTimeout);

      case DioExceptionType.badCertificate:
        return DioApiFailure("Bad Certificate ", ErrorCodes.badCertificate);

      case DioExceptionType.badResponse:
        return DioApiFailure.frombadResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return DioApiFailure(
            "Request to ApiServer was canceld", ErrorCodes.requestCancelled);
      case DioExceptionType.connectionError:
        return DioApiFailure(
            "No Internet Connection", ErrorCodes.noInternetConnection);
      case DioExceptionType.unknown:
        return DioApiFailure(
            "Unexpected Error, Please try again", ErrorCodes.unknownError);
    }
  }
  factory DioApiFailure.frombadResponse(int status, dynamic responseBody) {
    if (responseBody != null) {
      ApiErrorModel errorModel = ApiErrorModel.fromJson(responseBody);
      return DioApiFailure(errorModel.message, errorModel.error);
    } else {
      return DioApiFailure.fromStatusCode(status);
    }
  }

  factory DioApiFailure.fromStatusCode(int status) {
    switch (status) {
      case 400:
        return DioApiFailure(
          'Bad Request',
          ErrorCodes.badRequest,
        );
      case 401:
        return DioApiFailure(
          'Unauthorized',
          ErrorCodes.unauthorized,
        );
      case 403:
        return DioApiFailure(
          'Forbidden',
          ErrorCodes.forbidden,
        );
      case 404:
        return DioApiFailure(
          'Not Found',
          ErrorCodes.notFound,
        );
      case 409:
        return DioApiFailure(
          'Conflict',
          ErrorCodes.conflict,
        );
      case 422:
        return DioApiFailure(
          'Unprocessable Entity',
          ErrorCodes.unprocessableEntity,
        );
      case 500:
        return DioApiFailure(
          'Internal Server Error',
          ErrorCodes.internalServerError,
        );
      case 502:
        return DioApiFailure(
          'Bad Gateway',
          ErrorCodes.badGateway,
        );
      case 503:
        return DioApiFailure(
          'Service Unavailable',
          ErrorCodes.serviceUnavailable,
        );
      case 504:
        return DioApiFailure(
          'Gateway Timeout',
          ErrorCodes.gatewayTimeout,
        );
      default:
        return DioApiFailure(
          'Unknown Error',
          ErrorCodes.unknownError,
        );
    }
  }
}
