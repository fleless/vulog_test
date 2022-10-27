import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vulog_technical_test/data/models/enum/category_enum.dart';
import 'package:vulog_technical_test/data/network/data_state.dart';
import 'package:vulog_technical_test/domain/entities/product.dart';
import 'package:vulog_technical_test/domain/entities/rating.dart';
import 'package:vulog_technical_test/domain/usecases/get_single_product_usecase.dart';
import 'package:vulog_technical_test/presentation/provider_notifiers/single_product_provider.dart';

@GenerateMocks([GetSingleProductUseCase])
import 'single_product_provider_test.mocks.dart';

void main() {
  late SingleProductChangeNotifier sut;
  late MockGetSingleProductUseCase mockGetSingleProductUseCase;

  setUp(() {
    mockGetSingleProductUseCase = MockGetSingleProductUseCase();
    sut = SingleProductChangeNotifier(mockGetSingleProductUseCase);
  });

  test("initial values tester", () {
    expect(
        sut.product,
        const Product(
            title: "",
            price: 0,
            description: "",
            image: "",
            rating: Rating(rate: 0, count: 0),
            category: CategoryEnum.WOMEN_S_CLOTHING));
    expect(sut.isLoading, false);
  });

  group('getProducts', () {
    const productFromService = DataSuccess(Product(
        id: 101,
        title: "product 2",
        price: 399,
        description: 'description pro2',
        category: CategoryEnum.WOMEN_S_CLOTHING,
        image: "",
        rating: Rating(rate: 4.2, count: 298)));

    void arrangeProduct() {
      when(mockGetSingleProductUseCase(params: "101")).thenAnswer((_) async {
        return productFromService;
      });
    }

    test(
      """indicates loading of data,
      sets products to the ones from the usecase,
      indicates that data is not being loaded anymore""",
      () async {
        arrangeProduct();
        final future = sut.getSingleProduct("101");
        expect(sut.isLoading, true);
        await future;
        expect(sut.product, productFromService.data);
        expect(sut.isLoading, false);
      },
    );
  });
}
