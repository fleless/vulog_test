import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:provider/provider.dart';
import 'package:vulog_technical_test/data/models/enum/category_enum.dart';
import 'package:vulog_technical_test/data/network/data_state.dart';
import 'package:vulog_technical_test/domain/entities/product.dart';
import 'package:vulog_technical_test/domain/entities/rating.dart';
import 'package:vulog_technical_test/domain/usecases/get_single_product_usecase.dart';
import 'package:vulog_technical_test/modules/app/app_module.dart';
import 'package:vulog_technical_test/presentation/provider_notifiers/single_product_provider.dart';
import 'package:vulog_technical_test/presentation/ui/products/products_detail_screen.dart';

@GenerateMocks([GetSingleProductUseCase])
import 'products_detail_screen_test.mocks.dart';

class MyNavigatorMock extends Mock implements IModularNavigator {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockGetSingleProductUseCase mokeGetSingleProductUseCase;

  setUp(() {
    initModules([AppModule()]);
    mokeGetSingleProductUseCase = MockGetSingleProductUseCase();
  });

  const productFromService = DataSuccess(
    Product(
      id: 100,
      title: "product 1",
      price: 100,
      description: 'description pro1',
      category: CategoryEnum.ELECTRONICS,
      image: "",
      rating: Rating(rate: 3, count: 122),
    ),
  );

  void arrangeReturns2Products() {
    when(mokeGetSingleProductUseCase(params: "")).thenAnswer((_) async {
      await Future.delayed(const Duration(seconds: 2));
      return productFromService;
    });
  }

  // Tests commented due to appModular version conflict
  /*testWidgets(
    "appBar is displayed",
    (WidgetTester tester) async {
      arrangeReturns2Products();
      await tester.pumpWidget(buildTestableWidget(ChangeNotifierProvider(
        create: (_) => SingleProductChangeNotifier(mokeGetSingleProductUseCase),
        child: const ProductDetailScreen(101),
      )));
      expect(
          find.byKey(const Key("appbar"), skipOffstage: false), findsOneWidget);
    },
  );

  testWidgets(
    "check loading indicator is displayed while waiting for product",
    (WidgetTester tester) async {
      arrangeReturns2Products();

      await tester.pumpWidget(buildTestableWidget(ChangeNotifierProvider(
        create: (_) => SingleProductChangeNotifier(mokeGetSingleProductUseCase),
        child: const ProductDetailScreen(101),
      )));
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('progress-indicator')), findsOneWidget);

      await tester.pumpAndSettle();
    },
  );*/
}
