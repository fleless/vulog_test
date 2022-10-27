import 'package:flutter/material.dart';
import 'package:vulog_technical_test/constants/app_colors.dart';
import 'package:vulog_technical_test/constants/app_constants.dart';
import 'package:vulog_technical_test/constants/styles/app_styles.dart';

class PriceBadgeWidget extends StatelessWidget {
  final num? price;

  const PriceBadgeWidget(this.price, {super.key});

  final double iconSize = 15;

  Widget _buildPriceBadge() {
    return Card(
      elevation: 2,
      color: AppColors.darkGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.badgeGlobalRadius),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppConstants.badgeGlobalPadding),
        child: Text(
          "$price\$",
          maxLines: 1,
          overflow: TextOverflow.clip,
          style: AppStyles.categoryStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPriceBadge();
  }
}
