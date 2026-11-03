import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'network_exception.dart';

class Network {
  Network({required this.baseUrl}) {
    _initDio();
  }

  final String baseUrl;
  final _dio = Dio();

  void _initDio() {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      responseType: ResponseType.json,
    );

    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          requestHeader: false,
          responseHeader: false,
          logPrint: (object) => debugPrint(object.toString()),
        ),
      );
    }
  }

  Future<T> get<T>(String path, {Map<String, Object?>? queryParameters}) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
      );
      final data = response.data;
      if (data == null) {
        throw NetworkException(
          'Empty response body',
          statusCode: response.statusCode,
        );
      }
      return data;
    } on DioException catch (e) {
      throw NetworkException(
        e.message ?? e.type.name,
        statusCode: e.response?.statusCode,
      );
    }
  }
}
