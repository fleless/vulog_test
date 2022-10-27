import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vulog_technical_test/constants/app_constants.dart';
import 'package:vulog_technical_test/constants/app_images.dart';
import 'package:vulog_technical_test/constants/routes.dart';
import 'package:vulog_technical_test/constants/styles/app_styles.dart';
import 'package:vulog_technical_test/presentation/provider_notifiers/products_provider.dart';
import 'package:vulog_technical_test/presentation/ui/products/common/category_badge_widget.dart';
import 'package:vulog_technical_test/presentation/ui/products/common/price_badge_widget.dart';
import 'package:vulog_technical_test/utils/app_localizations.dart';
import 'package:vulog_technical_test/utils/star_rating.dart';
import 'package:vulog_technical_test/utils/theme_provider.dart';
import '../../../constants/app_colors.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final starRating = Modular.get<StarRating>();
  late ProductsChangeNotifier productsChangeNotifier;
  double listviewHorizontalPadding = 8.0;
  double listviewVerticalPadding = 16.0;

  @override
  void initState() {
    super.initState();
    productsChangeNotifier =
        ReadContext(context).read<ProductsChangeNotifier>();
    Future.microtask(
      () => productsChangeNotifier.getProducts(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.appBackground,
      appBar: AppBar(
        key: const Key("appbar"),
        title: Text(
          AppLocalizations.of(context).translate('product_list_title'),
          style: AppStyles.boldTitle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.pageGlobalPadding),
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Consumer<ProductsChangeNotifier>(
        builder: (context, notifier, child) {
      if (notifier.isLoading) {
        return const Center(
          child: CircularProgressIndicator(
            key: Key('progress-indicator'),
          ),
        );
      }
      return notifier.products.isEmpty
          ? _buildEmptyList()
          : _buildList(notifier);
    });
  }

  Widget _buildEmptyList() {
    return Center(
      child: Text(AppLocalizations.of(context).translate('empty_products_list'),
          style: AppStyles.emptyListMessageStyle, overflow: TextOverflow.clip),
    );
  }

  Widget _buildList(ProductsChangeNotifier notifier) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.microtask(() => productsChangeNotifier.getProducts());
      },
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: notifier.products.length,
        itemBuilder: (_, index) {
          final product = notifier.products[index];
          return Card(
            elevation: 5,
            child: InkWell(
              onTap: () => Modular.to.pushNamed(Routes.detailProductScreen,
                  arguments: {'productId': product.id}),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        _buildImageInList(product.image!),
                        const SizedBox(height: 5),
                        StarRating(
                          rating: product.rating!.rate!.toDouble(),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '(${product.rating!.count!.toString()} ${AppLocalizations.of(context).translate('votes')})',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.smallHintStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(width: AppConstants.pageGlobalPadding),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title!,
                            style: AppStyles.titleStyle,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CategoryBadgeWidget(product),
                              PriceBadgeWidget(product.price!),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            product.description!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 7,
                            style: AppStyles.subTitleStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        padding: EdgeInsets.symmetric(
          horizontal: listviewHorizontalPadding,
          vertical: listviewVerticalPadding,
        ),
      ),
    );
  }

  Widget _buildImageInList(String image) {
    return SizedBox(
      width: 80,
      height: 80,
      child: FadeInImage(
          fadeInDuration: const Duration(milliseconds: 500),
          fadeInCurve: Curves.easeInExpo,
          fadeOutCurve: Curves.easeOutExpo,
          placeholder: AssetImage(AppImages.emptyImage),
          image: NetworkImage(image),
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(AppImages.emptyImage);
          },
          fit: BoxFit.fill),
    );
  }
}
