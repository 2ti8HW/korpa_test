import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/di/injection.dart';
import '../../core/router/app_router_locations.dart';
import 'home_bloc.dart';
import 'home_screen.dart';

class HomeGoRoute extends GoRoute {
  HomeGoRoute()
    : super(
        path: AppRouterLocations.home,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<HomeBloc>()..add(const HomeEvent.started()),
          child: const HomeScreen(),
        ),
      );
}
