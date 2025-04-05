import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_opd/core/cache/secure_local_storage.dart';
import 'package:quick_opd/core/cache/storage_keys.dart';

import '../utils/logger.dart';

class ApiInterceptor extends Interceptor {
  final storage = GetIt.instance<SecureLocalStorage>();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await storage.load(key: StorageKeys.authToken);
    if (token != null) options.headers["Authorization"] = "Bearer $token";
    options.connectTimeout = const Duration(seconds: 30);
    options.receiveTimeout = const Duration(seconds: 30);
    options.headers["Content-Type"] = "application/json";
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e("API Error: ${err.response?.statusCode} - ${err.message}");
    super.onError(err, handler);
  }
}
