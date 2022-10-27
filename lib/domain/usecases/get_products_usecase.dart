import 'package:vulog_technical_test/data/network/data_state.dart';
import 'package:vulog_technical_test/domain/entities/product.dart';
import 'package:vulog_technical_test/domain/repositories/products_repository.dart';
import 'package:vulog_technical_test/domain/usecases/permis/usecase.dart';

class GetProductsUseCase implements UseCase<DataState<List<Product>>, String> {
  final ProductsRepository _productsRepository;

  GetProductsUseCase(this._productsRepository);

  @override
  Future<DataState<List<Product>>> call({required String params}) {
    return _productsRepository.getListOfProducts();
  }
}
