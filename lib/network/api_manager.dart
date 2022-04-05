import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
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
      print('path $path');
      print('queryParameters $queryParameters');

      Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: await _checkOptions('GET', options),
        cancelToken: cancelToken,
      );

      print('realUri ${response.realUri}');
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
    print('path - $path');
    print('data - $data');

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
    print('path $path');

    try {
      Response response = await _dio.put(
        path,
        data: data,
        options: await _checkOptions('PUT', options),
        cancelToken: cancelToken,
      );

      print('realUri ${response.realUri}');

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
    print('path $path');

    try {
      Response response = await _dio.delete(
        path,
        data: data,
        options: await _checkOptions('DELETE', options),
        cancelToken: cancelToken,
      );

      print('realUri ${response.realUri}');
      print('response $response');

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
      // String? token = await TokenManager.getAccesToken();
      //
      // print("token: $token");
      // if (token != null) {
      //   headers['Authorization'] = "Token " + token;
      // }

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

// void _refreshToken(
//   DioError error,
//   ErrorInterceptorHandler handler,
// ) async {
//   final path = error.requestOptions.path.split('/').last;
//
//   if (error.response?.statusCode == 401 &&
//       path != 'login' &&
//       path != 'register') {
//     _dio.lock();
//     _dio.interceptors.requestLock.lock();
//     _dio.interceptors.responseLock.lock();
//     _dio.interceptors.errorLock.lock();
//
//     RequestOptions opts = error.requestOptions;
//
//     // final accessToken = await TokenManager.getAccesToken();
//     // final canRefreshToken = await TokenManager.canTokenRefresh();
//     //
//     // if (!canRefreshToken) {
//     //   _dio.unlock();
//     //   _dio.interceptors.requestLock.unlock();
//     //   _dio.interceptors.responseLock.unlock();
//     //   _dio.interceptors.errorLock.clear();
//     //   _dio.interceptors.errorLock.unlock();
//     //
//     //   return handler.next(error);
//     // }
//
//     final refreshToken = await TokenManager.getRefreshToken();
//
//     if (refreshToken != null) {
//       http.Response response = await http.post(
//         Uri.parse(AppConfig.API_URI + '/api/oauth/refresh-token'),
//         headers: {
//           "Accept": "application/json",
//           "Content-Type": "application/x-www-form-urlencoded",
//         },
//         body: {
//           'refresh_token': refreshToken,
//         },
//         // encoding: Encoding.getByName("utf-8"),
//       );
//
//       final body = jsonDecode(response.body) as Map<String, dynamic>;
//
//       if (body['code'] >= 200 && body['code'] <= 300) {
//         final newTokenExpires = body['expires_in'];
//
//         final newAccessToken = body['access_token'];
//         final newRefreshToken = body['refresh_token'];
//
//         await TokenManager.setTokenExpire(newTokenExpires!);
//         await TokenManager.setAccessToken(
//           newAccessToken,
//           TokenType.user,
//         );
//         await TokenManager.setRefreshToken(newRefreshToken!);
//
//         opts.headers["Authorization"] = "Token " + newAccessToken!;
//
//         return handler.next(error);
//       }
//
//       if (body['code'] >= 400 && body['code'] <= 500) {
//         _dio.clear();
//         _dio.unlock();
//         _dio.interceptors.requestLock.clear();
//         _dio.interceptors.responseLock.clear();
//         _dio.interceptors.errorLock.clear();
//         _dio.interceptors.requestLock.unlock();
//         _dio.interceptors.responseLock.unlock();
//         _dio.interceptors.errorLock.unlock();
//
//         await TokenManager.removeTokenData();
//         // TODO logout user
//
//         // print("interceptor error: $error");
//       }
//     }
//   }
//
//   return handler.next(error);
// }
}
