import 'package:flutter/material.dart';

import 'core/di/injection.dart';
import 'core/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Currency Converter',
      theme: ThemeData(colorSchemeSeed: Colors.teal),
      routerConfig: getIt<AppRouter>().router,
    );
  }
}
