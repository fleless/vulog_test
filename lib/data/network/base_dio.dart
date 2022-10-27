import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vulog_technical_test/constants/app_constants.dart';

class BaseDio {
  static Dio getBaseDio() {
    Dio? dio;
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: AppConstants.connectTimeout,
      receiveTimeout: AppConstants.receiveTimeout,
    );

    dio = Dio(options);
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: kDebugMode,
        requestBody: kDebugMode,
        responseBody: kDebugMode,
        responseHeader: kDebugMode,
        error: kDebugMode,
        compact: kDebugMode,
        maxWidth: 90));
    return dio;
  }
}
