import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

/// LOGS
enum LogLevel {
  /// Only print input and output requests
  IN_OUT,

  /// Print all log information
  IN_OUT_DETAIL
}

@singleton
class ApiManager {
  static late Dio _dio;

  ApiManager() {
    _dio = Dio(_defaultOption())
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (
            RequestOptions options,
            RequestInterceptorHandler handler,
          ) async {
            return handler.next(options);
          },
          onResponse: (
            Response response,
            ResponseInterceptorHandler handler,
          ) async {
            return handler.next(response);
          },
          onError: (error, handler) async {
            // _refreshToken(error, handler);
          },
        ),
      );
  }

  /// GET
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      debugPrint('path $path');
      debugPrint('queryParameters $queryParameters');

      Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: await _checkOptions('GET', options),
        cancelToken: cancelToken,
      );

      debugPrint('realUri ${response.realUri}');
      return response;
    } on DioError catch (error) {
      return Future.value(error.response);
    }
  }

  /// POST
  Future<Response> post(
    String path, {
    data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    debugPrint('path - $path');
    debugPrint('data - $data');

    try {
      Response response = await _dio.post(
        path,
        data: data,
        options: await _checkOptions('POST', options),
        cancelToken: cancelToken,
      );

      return response;
    } on DioError catch (error) {
      return Future.value(error.response);
    }
  }

  /// PATCH
  Future<Response> patch(
    String path, {
    data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await _dio.patch(
        path,
        data: data,
        options: await _checkOptions('PATCH', options),
        cancelToken: cancelToken,
      );
      return response;
    } on DioError catch (error) {
      return Future.value(error.response);
    }
  }

  /// PUT
  Future<Response> put(
    String path, {
    data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    debugPrint('path $path');

    try {
      Response response = await _dio.put(
        path,
        data: data,
        options: await _checkOptions('PUT', options),
        cancelToken: cancelToken,
      );

      debugPrint('realUri ${response.realUri}');

      return response;
    } on DioError catch (error) {
      return Future.value(error.response);
    }
  }

  /// DELETE
  Future<Response> delete(
    String path, {
    data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    debugPrint('path $path');

    try {
      Response response = await _dio.delete(
        path,
        data: data,
        options: await _checkOptions('DELETE', options),
        cancelToken: cancelToken,
      );

      debugPrint('realUri ${response.realUri}');
      debugPrint('response $response');

      return response;
    } on DioError catch (error) {
      return Future.value(error.response);
    }
  }

  /// other request
  Future<Response> request(
    String method,
    String path, {
    data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await _dio.request(
        path,
        data: data,
        options: await _checkOptions(method, options),
        cancelToken: cancelToken,
      );
      return response;
    } on DioError catch (error) {
      return Future.value(error.response);
    }
  }

  /// check Options.
  Future<Options> _checkOptions(method, options) async {
    if (options == null) {
      Map<String, dynamic> headers = {
        'Accept': 'application/json',
        'X-Requested-With': 'XMLHttpRequest'
      };

      options = Options(
        method: method,
        contentType: 'application/json',
        headers: headers,
      );
    }
    return options;
  }

  /// Reset configuration information
  void resetConfig(BaseOptions? option) {
    if (option != null) {
      _dio.options = option;
    }
  }

  /// Set log printing
  void enableLog(LogLevel ll) {
    if (ll == LogLevel.IN_OUT) {
    } else if (ll == LogLevel.IN_OUT_DETAIL) {
      _dio.interceptors.add(LogInterceptor());
    } else {}
  }

  /// Default basic configuration
  static BaseOptions _defaultOption() {
    BaseOptions option = BaseOptions();
    option.baseUrl = 'https://jsonplaceholder.typicode.com/';
    option.contentType = 'application/json';
    option.connectTimeout = 1000 * 60;
    option.receiveTimeout = 1000 * 60;
    option.sendTimeout = 1000 * 60;
    option.headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest'
    };
    return option;
  }
}
