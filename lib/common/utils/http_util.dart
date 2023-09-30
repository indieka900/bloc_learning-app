import 'package:bloc_app/common/values/constants.dart';
import 'package:bloc_app/global.dart';
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

  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? auth = getAuthorization();
    if (auth != null) {
      requestOptions.headers!.addAll(auth);
    }
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParams,
      options: requestOptions
    );
    return response.data;
  }
  Future get(
    String path, {
    // dynamic data,
    // Map<String, dynamic>? queryParams,
    Options? options, 
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? auth = getAuthorization();
    if (auth != null) {
      requestOptions.headers!.addAll(auth);
    }
    var response = await dio.get(
      path,
      // data: data,
      // queryParameters: queryParams,
      options: requestOptions
    );
    return response.data;
  }

  Map<String, dynamic>? getAuthorization() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }
}
