import 'package:dio/dio.dart';

class _NetworkUtil {
  Dio _dio;

  _NetworkUtil(String baseUrl) {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    _dio = Dio(options);

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

  Future<T> get<T>(String path, {Map<String, dynamic> params}) async {
    try {
      Response<T> response = await _dio.get<T>(path, queryParameters: params);
      return response.data;
    } on DioError catch (e) {
      throw e.error;
    }
  }
}

_NetworkUtil http = _NetworkUtil("https://test.yomento.net");
