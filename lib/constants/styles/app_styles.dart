import 'package:flutter/material.dart';

import '../app_colors.dart';

/// This class provides custom styles to be used in the project.
///
class AppStyles {
  AppStyles._();

  static const boldTitle = TextStyle(
    fontFamily: 'openSans',
    color: AppColors.defaultBlack,
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );

  static const boldDetailTitle = TextStyle(
    fontFamily: 'openSans',
    color: AppColors.defaultBlack,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );

  static const emptyListMessageStyle = TextStyle(
    fontFamily: 'openSans',
    color: AppColors.darkGrey,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static const titleStyle = TextStyle(
    fontFamily: 'openSans',
    color: AppColors.defaultBlack,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );

  static const subTitleStyle = TextStyle(
    fontFamily: 'openSans',
    color: AppColors.defaultBlack,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  static const subTitleDetailStyle = TextStyle(
    fontFamily: 'openSans',
    color: AppColors.defaultBlack,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static const categoryStyle = TextStyle(
    fontFamily: 'openSans',
    color: AppColors.appBackground,
    fontWeight: FontWeight.w500,
    fontSize: 9,
  );

  static const smallHintStyle = TextStyle(
    fontFamily: 'openSans',
    color: AppColors.darkGrey,
    fontWeight: FontWeight.w500,
    fontSize: 8,
  );

}
