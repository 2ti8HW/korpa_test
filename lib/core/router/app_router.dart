import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../features/history/history_go_route.dart';
import 'app_router_locations.dart';
import 'app_shell_route.dart';

@lazySingleton
class AppRouter {
  late final GoRouter router = GoRouter(
    initialLocation: AppRouterLocations.home,
    routes: [AppShellRoute(), HistoryGoRoute()],
  );
}
