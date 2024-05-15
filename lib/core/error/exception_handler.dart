import 'package:dio/dio.dart';

import '../resources/data_state.dart';
import 'error_response.dart';

abstract class DataException {
  static DataError<T> getError<T>(dynamic exception) {
    if (exception is DioException) {
      if (exception.response != null && exception.response?.data != null) {
        return DataError<T>(ErrorResponse.fromJson(exception.response?.data));
      }

      if (exception.type == DioExceptionType.connectionError) {
        return DataError<T>(
            const ErrorResponse(message: 'connection_error', status: -400));
      } else if (exception.type == DioExceptionType.connectionTimeout) {
        return DataError<T>(
            const ErrorResponse(message: 'connection_timeout', status: 0));
      } else if (exception.type == DioExceptionType.badResponse) {
        return DataError<T>(
            const ErrorResponse(message: 'something_went_wrong', status: 0));
      }
    }
    return DataError<T>(
      ErrorResponse(message: exception.toString(), status: 0),
    );
  }
}
