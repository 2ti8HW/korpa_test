import 'package:go_router/go_router.dart';

import '../../features/home/home_go_route.dart';
import '../../features/rates/rates_go_route.dart';
import 'app_shell.dart';

class AppShellRoute extends StatefulShellRoute {
  AppShellRoute()
    : super.indexedStack(
        builder: (context, state, navigationShell) =>
            AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [HomeGoRoute()]),
          StatefulShellBranch(routes: [RatesGoRoute()]),
        ],
      );
}
