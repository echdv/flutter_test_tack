/* External dependencies */
import 'package:dio/dio.dart';

class CatchException {
  final String message;
  final Response<dynamic>? response;

  CatchException({required this.message, this.response});

  static CatchException convertException(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return CatchException(message: 'Слабое соединение');
        case DioExceptionType.receiveTimeout:
          return CatchException(message: 'Тайм-аут получения данных');
        case DioExceptionType.sendTimeout:
          return CatchException(message: 'Тайм-аут отправки данных');
        case DioExceptionType.badResponse:
          return CatchException(
              message: 'Ошибка: ${error.response?.statusCode}',
              response: error.response);
        case DioExceptionType.cancel:
          return CatchException(message: 'Запрос отменен');
        case DioExceptionType.connectionError:
          return CatchException(message: 'Нет интернет соединения');
        case DioExceptionType.badCertificate:
          return CatchException(message: 'Недоверенный сертификат');
        default:
          return CatchException(message: 'Произошла неизвестная ошибка');
      }
    }

    return CatchException(message: 'Произошла неизвестная ошибка');
  }
}
