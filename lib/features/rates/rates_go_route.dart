import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/di/injection.dart';
import '../../core/router/app_router_locations.dart';
import 'rates_bloc.dart';
import 'rates_screen.dart';

class RatesGoRoute extends GoRoute {
  RatesGoRoute()
    : super(
        path: AppRouterLocations.rates,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<RatesBloc>()..add(const RatesEvent.started()),
          child: const RatesScreen(),
        ),
      );
}
