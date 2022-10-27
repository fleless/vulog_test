import 'package:flutter/material.dart';
import 'package:vulog_technical_test/constants/app_constants.dart';
import 'package:vulog_technical_test/constants/styles/app_styles.dart';
import 'package:vulog_technical_test/domain/entities/product.dart';

class CategoryBadgeWidget extends StatelessWidget {
  final Product? product;

  const CategoryBadgeWidget(this.product, {super.key});

  final double iconSize = 15;

  Widget _buildCategoryBadge() {
    return Card(
      elevation: 2,
      color: product!.getColorOfCategory(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.badgeGlobalRadius),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppConstants.badgeGlobalPadding),
        child: Text(
          product!.category!.name,
          maxLines: 1,
          overflow: TextOverflow.clip,
          style: AppStyles.categoryStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCategoryBadge();
  }
}
