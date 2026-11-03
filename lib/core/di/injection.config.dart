// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:korpa_test/core/network/app_api.dart' as _i603;
import 'package:korpa_test/core/router/app_router.dart' as _i5;
import 'package:korpa_test/core/storage/prefs.dart' as _i949;
import 'package:korpa_test/features/currency_picker/currency_picker_bloc.dart'
    as _i475;
import 'package:korpa_test/features/history/history_bloc.dart' as _i791;
import 'package:korpa_test/features/home/home_bloc.dart' as _i572;
import 'package:korpa_test/features/rates/rates_bloc.dart' as _i783;
import 'package:korpa_test/models/currency.dart' as _i129;
import 'package:korpa_test/repositories/repository.dart' as _i647;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    await gh.singletonAsync<_i949.Prefs>(
      () => _i949.Prefs.create(),
      preResolve: true,
    );
    gh.lazySingleton<_i603.AppApi>(() => _i603.AppApi());
    gh.lazySingleton<_i5.AppRouter>(() => _i5.AppRouter());
    gh.factoryParam<_i475.CurrencyPickerBloc, List<_i129.Currency>, String>(
      (currencies, selected) => _i475.CurrencyPickerBloc(currencies, selected),
    );
    gh.lazySingleton<_i647.Repository>(
      () => _i647.Repository(gh<_i603.AppApi>(), gh<_i949.Prefs>()),
    );
    gh.factory<_i791.HistoryBloc>(
      () => _i791.HistoryBloc(gh<_i647.Repository>()),
    );
    gh.factory<_i572.HomeBloc>(() => _i572.HomeBloc(gh<_i647.Repository>()));
    gh.factory<_i783.RatesBloc>(() => _i783.RatesBloc(gh<_i647.Repository>()));
    return this;
  }
}
