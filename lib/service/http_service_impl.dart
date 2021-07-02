import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:news_app/service/http_service.dart';

const BASE_URL = "https://newsapi.org/";
const API_KEY = "5fba7de521434971b0d9a516eef733ae";

class HttpServiceImpl implements HttpService {
  late Dio _dio;
  @override
  Future<Response> getRequest(String url) async {
    Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptor() {
    _dio.interceptors
        .add(InterceptorsWrapper(onError: (error, errorInterceptorHandler) {
      print(error.message);
    }, onRequest: (request, requestInterceptorHandler) {
      print("${request.method} | ${request.path}");
    }, onResponse: (response, responseInterceptorHandler) {
      print(
          "${response.statusCode} ${response.statusMessage} ${response.data}");
    }));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(
        baseUrl: BASE_URL, headers: {"Authorization": "Bearer $API_KEY"}));
    initializeInterceptor();
  }
}
