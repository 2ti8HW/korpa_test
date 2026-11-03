import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/di/injection.dart';
import '../../core/router/app_router_locations.dart';
import 'history_bloc.dart';
import 'history_screen.dart';

class HistoryGoRoute extends GoRoute {
  HistoryGoRoute()
    : super(
        path: AppRouterLocations.history,
        builder: (context, state) => BlocProvider(
          create: (_) =>
              getIt<HistoryBloc>()..add(const HistoryEvent.started()),
          child: const HistoryScreen(),
        ),
      );
}
