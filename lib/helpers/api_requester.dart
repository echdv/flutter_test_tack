/* External dependencies */
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

/* Local dependencies */
import 'package:flutter_test_task/helpers/catch_exception.dart';

class ApiRequester {
  final String baseUrl = 'https://odigital.pro/';

  ApiRequester();

  Future<Dio> initDio() async {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: 'application/json; charset=utf-8',
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
  }

  Future<Response> toGet(
    String url, {
    Map<String, dynamic>? param,
    Map<String, dynamic>? data,
  }) async {
    bool isConnected = await checkInternetConnection();
    if (!isConnected) {
      throw CatchException(message: 'Нет интернет соединение');
    }
    Dio dio = await initDio();
    try {
      return await dio.get(
        url,
        queryParameters: param,
        data: data,
        options: Options(
          responseType: ResponseType.plain,
        ),
      );
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
