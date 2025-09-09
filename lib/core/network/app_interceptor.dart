import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nwhco_app/core/util/shared_preferences.dart';

class AppInterceptor extends Interceptor {
  AppInterceptor();

  @override
  Future<void> onRequest(options, handler) async {
    final token = await getLoggedInToken();
    final language = await getLanguage();

    options.headers["build-number"] = '1.0.0';
    options.headers["platform"] = Platform.operatingSystem;
    options.headers["accept-language"] = language;
    options.headers["X-User-Language"] = language;
    options.headers["Authorization"] = "Token $token";

    handler.next(options);
  }

  @override
  void onResponse(response, handler) {
    handler.next(response);
  }
}
