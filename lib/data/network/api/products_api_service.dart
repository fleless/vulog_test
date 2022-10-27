import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vulog_technical_test/constants/endpoints.dart';
import 'package:vulog_technical_test/data/models/responses/product_model.dart';

part 'products_api_service.g.dart';

@RestApi(baseUrl: Endpoints.coreUrl)
abstract class ProductsApiService {
  factory ProductsApiService(Dio dio, {String baseUrl}) = _ProductsApiService;

  @GET('/products')
  Future<HttpResponse<List<ProductModel>>> getProducts();

  @GET('/products/{id}')
  Future<HttpResponse<ProductModel>> getSingleProduct(@Path("id") String id);
}
