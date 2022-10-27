import 'package:flutter/foundation.dart';
import 'package:vulog_technical_test/data/network/data_state.dart';
import 'package:vulog_technical_test/domain/entities/product.dart';
import 'package:vulog_technical_test/domain/usecases/get_products_usecase.dart';

class ProductsChangeNotifier extends ChangeNotifier {
  final GetProductsUseCase _getProductsUseCase;

  ProductsChangeNotifier(this._getProductsUseCase);

  final List<Product> _products = [];

  List<Product> get products => _products;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> getProducts() async {
    _isLoading = true;
    notifyListeners();
    final dataState = await _getProductsUseCase(params: "");
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      _products.clear();
      _products.addAll(dataState.data!);
    }
    if (dataState is DataFailed) {
      if (kDebugMode) {
        print("an error occured");
      }
    }
    _isLoading = false;
    notifyListeners();
  }
}
