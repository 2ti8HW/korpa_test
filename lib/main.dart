import 'dart:async';

import 'package:flutter/material.dart';

import 'app.dart';
import 'core/di/injection.dart';
import 'repositories/repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  final repository = getIt<Repository>();
  if (!repository.loadFromCache()) {
    unawaited(repository.loadFromNetwork().catchError((Object _) {}));
  }

  runApp(const App());
}
