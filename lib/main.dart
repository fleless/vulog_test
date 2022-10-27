import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:vulog_technical_test/utils/theme_provider.dart';

import 'modules/app/app_module.dart';
import 'modules/app/app_widget.dart';

/// Application entry point
// Wraps  main module in ModularApp to initialize it with Modular
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ModularApp(
      module: AppModule(),
      child: ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: const AppWidget(),
      ),
    ),
  );
}
