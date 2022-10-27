import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:vulog_technical_test/constants/routes.dart';
import 'package:vulog_technical_test/data/network/repository/products_repository_impl.dart';
import 'package:vulog_technical_test/domain/usecases/get_products_usecase.dart';
import 'package:vulog_technical_test/domain/usecases/get_single_product_usecase.dart';
import 'package:vulog_technical_test/presentation/provider_notifiers/products_provider.dart';
import 'package:vulog_technical_test/presentation/provider_notifiers/single_product_provider.dart';
import 'package:vulog_technical_test/presentation/ui/products/products_detail_screen.dart';
import 'package:vulog_technical_test/presentation/ui/products/products_screen.dart';
import 'package:vulog_technical_test/utils/shared_preference_helper.dart';
import 'package:vulog_technical_test/utils/star_rating.dart';
import 'app_widget.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
        Bind((_) => const StarRating()), //injecting StarRating
        Bind((_) => SharedPreferenceHelper()), //injecting SharedPrefHelper
      ];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, __) => ChangeNotifierProvider(
            create: (_) => ProductsChangeNotifier(
                GetProductsUseCase(ProductsRepositoryImpl())),
            child: const ProductsScreen(),
          ),
        ),
        ChildRoute(
          Routes.listProductsScreen,
          child: (_, __) => ChangeNotifierProvider(
            create: (_) => ProductsChangeNotifier(
                GetProductsUseCase(ProductsRepositoryImpl())),
            child: const ProductsScreen(),
          ),
        ),
        ChildRoute(
          Routes.detailProductScreen,
          child: (_, args) => ChangeNotifierProvider(
            create: (_) => SingleProductChangeNotifier(
                GetSingleProductUseCase(ProductsRepositoryImpl())),
            child: ProductDetailScreen(args.data['productId']),
          ),
          transition: TransitionType.rightToLeftWithFade,
        ),
      ];

  // Provide the root widget associated with your module
  Widget get bootstrap => const AppWidget();
}
