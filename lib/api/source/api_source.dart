// Package imports:
import 'package:dio/dio.dart';

class ApiSource {
  final _dio = Dio(BaseOptions(
    baseUrl: 'https://fakestoreapi.com/',
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
  ));

  postRequest({
    body,
    Map<String, dynamic>? queryParams,
    String url = 'auth/login',
    bool auth = false,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        queryParameters: queryParams,
        data: body,
        options: Options(
          headers: _setHeaders(
            auth: auth,
          ),
          //contentType: Headers.formUrlEncodedContentType,
          responseType: ResponseType.json,
        ),
      );
      return _responseCodeSerializer(response);
    } catch (e) {
      rethrow;
    }
  }

  getRequest({
    Map<String, dynamic>? queryParams,
    String url = 'products',
    bool auth = true,
  }) async {
    try {
      Map<String, dynamic>? queryParameters = queryParams;

      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: _setHeaders(
            auth: auth,
          ),
          contentType: Headers.formUrlEncodedContentType,
          responseType: ResponseType.json,
        ),
      );
      return _responseCodeSerializer(response);
    } catch (e) {
      rethrow;
    }
  }

  _responseCodeSerializer(Response response) {
    if (response.statusCode! >= 200 && response.statusCode! <= 299) {
      return response;
    } else {
      try {
        return response.data;
      } catch (e) {
        throw Exception("Unknown error occurred. Please try again.");
      }
    }
  }

  Map<String, dynamic> _setHeaders({
    required bool auth,
  }) {
    Map<String, dynamic> header = {};
    header['Accept'] = 'application/json';

    if (auth) {
      header["Authorization"] = "Bearer token";
    }
    return header;
  }
}
