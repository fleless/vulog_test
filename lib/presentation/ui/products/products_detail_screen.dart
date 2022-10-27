import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vulog_technical_test/constants/app_constants.dart';
import 'package:vulog_technical_test/constants/app_images.dart';
import 'package:vulog_technical_test/constants/styles/app_styles.dart';
import 'package:vulog_technical_test/presentation/provider_notifiers/single_product_provider.dart';
import 'package:vulog_technical_test/presentation/ui/products/common/category_badge_widget.dart';
import 'package:vulog_technical_test/presentation/ui/products/common/price_badge_widget.dart';
import 'package:vulog_technical_test/utils/app_localizations.dart';
import 'package:vulog_technical_test/utils/star_rating.dart';
import '../../../constants/app_colors.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final num? productId;

  const ProductDetailScreen(this.productId, {super.key});

  @override
  State<StatefulWidget> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late SingleProductChangeNotifier singleProductChangeNotifier;
  double listviewHorizontalPadding = 8.0;
  double listviewVerticalPadding = 16.0;

  @override
  void initState() {
    super.initState();
    singleProductChangeNotifier =
        ReadContext(context).read<SingleProductChangeNotifier>();
    Future.microtask(
      () => singleProductChangeNotifier
          .getSingleProduct(widget.productId.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.appBackground,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('product_detail_title'),
          style: AppStyles.boldTitle,
        ),
        leading: GestureDetector(
          onTap: () => Modular.to.pop(),
          child: const Icon(
            Icons.arrow_back,
            size: 20,
            color: AppColors.defaultBlack,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppConstants.pageGlobalPadding),
            child: _buildContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Consumer<SingleProductChangeNotifier>(
      builder: (context, notifier, child) {
        if (notifier.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              key: Key('progress-indicator'),
            ),
          );
        }
        return _buildProductWidget(notifier);
      },
    );
  }

  Widget _buildProductWidget(SingleProductChangeNotifier notifier) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildImage(notifier.product.image!),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                notifier.product.title!,
                style: AppStyles.boldDetailTitle,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PriceBadgeWidget(notifier.product.price),
            CategoryBadgeWidget(notifier.product),
            Column(
              children: [
                StarRating(
                  rating: notifier.product.rating!.rate!.toDouble(),
                ),
                const SizedBox(height: 3),
                Text(
                  '(${notifier.product.rating!.count!.toString()} ${AppLocalizations.of(context).translate('votes')})',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.smallHintStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 20),
        Text(
          notifier.product.description!,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.subTitleDetailStyle,
          maxLines: 100,
        ),
      ],
    );
  }

  Widget _buildImage(String image) {
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
