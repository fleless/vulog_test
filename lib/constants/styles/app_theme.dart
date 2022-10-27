import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';
import 'app_bottom_navbar_theme.dart';
import 'app_fab_theme.dart';
import 'app_text_theme.dart';

/// This class allows for global overrides of material ThemeData
///
class AppTheme {
  AppTheme._();

  static ThemeData themeData = ThemeData(
    primaryColor: AppColors.appBackground,
    backgroundColor: AppColors.appBackground,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.appBackground,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.openSansTextTheme(AppTextTheme.textTheme),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        systemNavigationBarDividerColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.black,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    bottomAppBarTheme: AppBottomNavBarTheme.bottomAppBarTheme,
    floatingActionButtonTheme: AppFABTheme.fABTheme,
    iconTheme: const IconThemeData(),
    primarySwatch: MaterialColor(0xFFF79645, AppColors.colorCodes),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
      secondary: AppColors.defaultColor
    ),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.defaultColor,
    ),
  );
}
