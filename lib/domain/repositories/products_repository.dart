import 'package:vulog_technical_test/data/network/data_state.dart';
import 'package:vulog_technical_test/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<DataState<List<Product>>> getListOfProducts();

  Future<DataState<Product>> getSingleProduct(String id);
}
