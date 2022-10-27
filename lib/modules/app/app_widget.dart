import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vulog_technical_test/constants/styles/app_theme.dart';
import 'package:vulog_technical_test/utils/app_localizations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).translate('title'),
      theme: AppTheme.themeData,
      darkTheme: AppTheme.themeData,
      //List of all supported locales
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('fr', 'FR'),
      ],
      //These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: const [
        //A class which loads the translations from JSON files
        AppLocalizations.delegate,
        //Built-in localization of basic text for Material widgets (means those default Material widget such as alert dialog icon text)
        GlobalMaterialLocalizations.delegate,
        //Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //return a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        //check if the current device locale is supported or not
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode ||
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        //if the locale from the mobile device is not supported yet,
        //use the first one from the list (in our case, that will be English)
        return supportedLocales.first;
      },
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
