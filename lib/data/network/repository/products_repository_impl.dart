import 'dart:io';

import 'package:dio/dio.dart';
import 'package:vulog_technical_test/data/network/api/products_api_service.dart';
import 'package:vulog_technical_test/data/network/base_dio.dart';
import 'package:vulog_technical_test/data/network/data_state.dart';
import 'package:vulog_technical_test/domain/entities/product.dart';
import 'package:vulog_technical_test/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsApiService _productsApiService =
      ProductsApiService(BaseDio.getBaseDio());

  ProductsRepositoryImpl();

  @override
  Future<DataState<List<Product>>> getListOfProducts() async {
    try {
      final httpResponse = await _productsApiService.getProducts();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioErrorType.response,
          requestOptions: httpResponse.response.requestOptions,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<Product>> getSingleProduct(String id) async {
    try {
      final httpResponse = await _productsApiService.getSingleProduct(id);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioErrorType.response,
          requestOptions: httpResponse.response.requestOptions,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
