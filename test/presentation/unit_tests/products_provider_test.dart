import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vulog_technical_test/data/models/enum/category_enum.dart';
import 'package:vulog_technical_test/data/network/data_state.dart';
import 'package:vulog_technical_test/domain/entities/product.dart';
import 'package:vulog_technical_test/domain/entities/rating.dart';
import 'package:vulog_technical_test/domain/usecases/get_products_usecase.dart';
import 'package:vulog_technical_test/presentation/provider_notifiers/products_provider.dart';

@GenerateMocks([GetProductsUseCase])
import 'products_provider_test.mocks.dart';

void main() {
  late ProductsChangeNotifier sut;
  late MockGetProductsUseCase mokeGetProductsUseCase;

  setUp(() {
    mokeGetProductsUseCase = MockGetProductsUseCase();
    sut = ProductsChangeNotifier(mokeGetProductsUseCase);
  });

  test("initial values tester", () {
    expect(sut.products, []);
    expect(sut.isLoading, false);
  });

  group('getProducts', () {
    const productsFromService = DataSuccess([
      Product(
          id: 100,
          title: "product 1",
          price: 100,
          description: 'description pro1',
          category: CategoryEnum.ELECTRONICS,
          image: "",
          rating: Rating(rate: 3, count: 122)),
      Product(
          id: 101,
          title: "product 2",
          price: 399,
          description: 'description pro2',
          category: CategoryEnum.WOMEN_S_CLOTHING,
          image: "",
          rating: Rating(rate: 4.2, count: 298)),
    ]);

    void arrangeReturns2Products() {
      when(mokeGetProductsUseCase(params: "")).thenAnswer((_) async {
        return productsFromService;
      });
    }

    test(
      """indicates loading of data,
      sets products to the ones from the usecase,
      indicates that data is not being loaded anymore""",
      () async {
        arrangeReturns2Products();
        final future = sut.getProducts();
        expect(sut.isLoading, true);
        await future;
        expect(sut.products, productsFromService.data);
        expect(sut.isLoading, false);
      },
    );
  });
}
