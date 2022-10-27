import 'package:vulog_technical_test/data/network/data_state.dart';
import 'package:vulog_technical_test/domain/entities/product.dart';
import 'package:vulog_technical_test/domain/repositories/products_repository.dart';
import 'package:vulog_technical_test/domain/usecases/permis/usecase.dart';

class GetSingleProductUseCase implements UseCase<DataState<Product>, String> {
  final ProductsRepository _productsRepository;

  GetSingleProductUseCase(this._productsRepository);

  @override
  Future<DataState<Product>> call({required String params}) {
    return _productsRepository.getSingleProduct(params);
  }
}
