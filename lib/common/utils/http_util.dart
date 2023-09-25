import 'package:bloc_app/common/values/constants.dart';
import 'package:dio/dio.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() {
    return _instance;
  }
  late Dio dio;
  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConst.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );
    dio = Dio(options);
  }

  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParams}) async {
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParams,
    );
    return response.data;
  }
}
