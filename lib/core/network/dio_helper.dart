import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://tabcash.vercel.app/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    Map<String, dynamic>? data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'authorization': '$token'
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio.post(
      url,
      data: data,
    );
  }

  static Future<Response> patchData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'authorization': '$token'
    };
    return await dio.patch(
      url,
      data: data,
    );
  }

  static Future<Response> putData(
      {required String url,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data,
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'authorization': '$token'
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData(
      {required String url, String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'authorization': '$token'
    };
    return await dio.delete(url);
  }
}
