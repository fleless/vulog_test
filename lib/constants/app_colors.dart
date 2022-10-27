import 'package:flutter/material.dart';

/// This class provides custom colors to be used in the project.
///
class AppColors {
  AppColors._();

  static const Color appBackground = Color(0xFFffffff);
  static const Color defaultColor = Color(0xFFF79645);
  static const Color defaultBlack = Color(0xFF202020);
  static const Color darkGrey = Color(0xFF404040);
  static const Color errorColor = Color(0xFFF44336);
  static const Color electronicsColors = Color(0xFF2187A4);
  static const Color jeweleryColors = Color(0xFFBD7B2D);
  static const Color menClothesColors = Color(0xFF1E5757);
  static const Color womenClothesColors = Color(0xFFA42A60);
  static const Color starReachedColor = Color(0xFFE3D206);
  static const Color starUnreachedColor = Color(0xFF9D9B9C);

  static Map<int, Color> colorCodes = {
    50: const Color.fromRGBO(247, 150, 69, .1),
    100: const Color.fromRGBO(247, 150, 69, .2),
    200: const Color.fromRGBO(247, 150, 69, .3),
    300: const Color.fromRGBO(247, 150, 69, .4),
    400: const Color.fromRGBO(247, 150, 69, .5),
    500: const Color.fromRGBO(247, 150, 69, .6),
    600: const Color.fromRGBO(247, 150, 69, .7),
    700: const Color.fromRGBO(247, 150, 69, .8),
    800: const Color.fromRGBO(247, 150, 69, .9),
    900: const Color.fromRGBO(247, 150, 69, 1),
  }; // Opacity 20%
}
