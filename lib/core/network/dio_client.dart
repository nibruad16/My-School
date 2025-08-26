import 'package:dio/dio.dart';


class DioClient{
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:8000/api/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      
    ),
  );


Dio get dio => _dio;

void addInterceptors(List<Interceptor> interceptors) {
    _dio.interceptors.addAll(interceptors);

    

  }
}