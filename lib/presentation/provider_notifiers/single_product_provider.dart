import 'package:flutter/foundation.dart';
import 'package:vulog_technical_test/data/models/enum/category_enum.dart';
import 'package:vulog_technical_test/data/network/data_state.dart';
import 'package:vulog_technical_test/domain/entities/product.dart';
import 'package:vulog_technical_test/domain/entities/rating.dart';
import 'package:vulog_technical_test/domain/usecases/get_single_product_usecase.dart';

class SingleProductChangeNotifier extends ChangeNotifier {
  final GetSingleProductUseCase _getSingleProductUseCase;

  SingleProductChangeNotifier(this._getSingleProductUseCase);

  //Make a default product to avoid null
  Product _product = const Product(
      title: "",
      price: 0,
      description: "",
      image: "",
      rating: Rating(rate: 0, count: 0),
      category: CategoryEnum.WOMEN_S_CLOTHING);

  Product get product => _product;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> getSingleProduct(String id) async {
    _isLoading = true;
    notifyListeners();
    final dataState = await _getSingleProductUseCase(params: id);
    if (dataState is DataSuccess && dataState.data!.id != null) {
      _product = dataState.data!;
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
