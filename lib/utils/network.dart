import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';

class _NetworkUtil {
  Dio _dio;

  _NetworkUtil(String baseUrl) {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json; charset=utf-8',
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );
    _dio = Dio(options);

    _addInterceptor();
  }

  Future<T> get<T>(String path, {Map<String, dynamic> params}) async {
    try {
      Response<T> response = await _dio.get<T>(path, queryParameters: params);
      return response.data;
    } on DioError catch (e) {
      throw e.error;
    }
  }

  Future<T> post<T>(String path, {Map<String, dynamic> params}) async {
    try {
      Response response = await _dio.post<String>(path,
          queryParameters: params, options: Options(headers: _createCustomHeaders()));

      final jsonObj = json.decode(response.data);
      return jsonObj;
    } on DioError catch (e) {
      throw e.error;
    }
  }

  Map<String, dynamic> _createCustomHeaders() {
    String platform = Platform.operatingSystem;
    return {
      'platform': platform,
      'language': 'en',
      'authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImJiYjZmZDJjNzQyMWIwNzZjYWMyZjNlNmI0M2YxMjFkODcwNjk5OWViNzhjMDliNzFiNjAwYzRhZWQ1ZDNiYWVlODNkMDIzOTI2YjMwYTdlIn0.eyJhdWQiOiIxNCIsImp0aSI6ImJiYjZmZDJjNzQyMWIwNzZjYWMyZjNlNmI0M2YxMjFkODcwNjk5OWViNzhjMDliNzFiNjAwYzRhZWQ1ZDNiYWVlODNkMDIzOTI2YjMwYTdlIiwiaWF0IjoxNTgwMjIyMzQ3LCJuYmYiOjE1ODAyMjIzNDcsImV4cCI6MTYxMTg0NDc0Nywic3ViIjoiMTI4NCIsInNjb3BlcyI6W119.BdZVHxPRduFxaHE1fxgKFknssYQx3LErgJ-GjDey9MB87x2DgXSS30lootpGGqRqo3sl1-SsjlZvDTQmPx_XoeXHTIFZcQqsAJUqWDrbnyDvBqWY0wJtb_1WeJWPHkt0XAfPP8IL05P2BtEUmwZ_SiOGYzKqtC39sxahL1235VRwoqazAYhC97DOXnHuXvFMlsJciARf53xJ9DMQU44pMFACu6Prp98kXax5RWi37AeSh6ahzdpte4UGRIpdpm4rTlc4Bl5NFu981eJBWQPHiqN8P8Bn12uh2s3zbwaErVi9Ab5XHFgIzVzlYH1T1vPuAnPtE6nk20R4qh_4FQslWDZm_HrJl1z6jXfrAh9RhXdXjEBF8XsGnaM2GH-TAUU8hzZl_36xQCdMCBaQDZpxEF-5T-AIPl_U4_7TfEodR6UI5nM1n9lkyjfggdtMHii3Bs61X25miZcefZVS6vPoxMvi9N3EtqrY7mIkVvlyYHG8OavXl5z_MJ817kl7vGDBnp0B_lPGbHc9Y9b7pGdtnojEAHwjk5uv7_ZwNn7Q3QRyJhdn2qUZdKQkbGB0zaxmDPt8kFt6l0f4QWBg6TGPyq1nX4TqNP_J2_tmnChImENUcw_JeqA6HWnDHKdR8kJ6aWI3_Z4iBL5eUGhac-2_2b02AzezltLVfZzhSU-EiOs',
      'app-version': 250,
      'client-id': 10,
      'client-secret': 'HehW00eAy4eApRevurA1fMpD0bCKH7BQV61nEIFu'
    };
  }

  void _addInterceptor() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      /// Do something before send out a http request.

      /// 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象
      /// 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data
      // return Response(data: 'Mock data from ${options.path}');

      /// 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象
      /// 这样请求将被中止并触发异常，上层catchError会被调用
      // return DioError(error: "Somthing goes wrong");

      /// Normal request
      return options;
    }, onResponse: (Response response) async {
      /// Do something after receive a response
      print("Get response from ${response.request.path} -> $response");

      return response; // continue
    }, onError: (DioError e) async {
      /// Do something when receive a error
      print("path => ${e.request.path}, type => ${e.type}, error => ${e.error}");

      return e; //continue
    }));
  }
}

_NetworkUtil http = _NetworkUtil("http://live.yomento.se");
