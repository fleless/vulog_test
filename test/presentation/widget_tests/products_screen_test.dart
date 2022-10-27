import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:vulog_technical_test/data/models/enum/category_enum.dart';
import 'package:vulog_technical_test/data/network/data_state.dart';
import 'package:vulog_technical_test/domain/entities/product.dart';
import 'package:vulog_technical_test/domain/entities/rating.dart';
import 'package:vulog_technical_test/domain/usecases/get_products_usecase.dart';
import 'package:vulog_technical_test/modules/app/app_module.dart';

@GenerateMocks([GetProductsUseCase])
import 'products_screen_test.mocks.dart';

class MyNavigatorMock extends Mock implements IModularNavigator {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockGetProductsUseCase mokeGetProductsUseCase;

  setUp(() {
    initModules([AppModule()]);
    mokeGetProductsUseCase = MockGetProductsUseCase();
  });

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
      await Future.delayed(const Duration(seconds: 2));
      return productsFromService;
    });
  }

  // Tests commented due to appModular version conflict
  /*testWidgets(
    "appBar is displayed",
    (WidgetTester tester) async {
      arrangeReturns2Products();
      await tester.pumpWidget(buildTestableWidget(ChangeNotifierProvider(
        create: (_) => ProductsChangeNotifier(mokeGetProductsUseCase),
        child: const ProductsScreen(),
      )));
      expect(
          find.byKey(const Key("appbar"), skipOffstage: false), findsOneWidget);
    },
  );

  testWidgets(
    "check loading indicator is displayed while waiting for products",
    (WidgetTester tester) async {
      arrangeReturns2Products();

      await tester.pumpWidget(buildTestableWidget(ChangeNotifierProvider(
        create: (_) => ProductsChangeNotifier(mokeGetProductsUseCase),
        child: const ProductsScreen(),
      )));
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('progress-indicator')), findsOneWidget);

      await tester.pumpAndSettle();
    },
  );*/
}
