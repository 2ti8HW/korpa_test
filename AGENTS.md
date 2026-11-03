# AGENTS.md

Currency converter built with Flutter. Platforms: iOS and Android.

## Environment

- Flutter is pinned via fvm (`.fvmrc`, version 3.47.9). Run every command through `fvm`, never through the global `flutter`/`dart`.
- Do not change the Flutter version or run `fvm use` unless explicitly asked.

```bash
fvm flutter pub get
fvm flutter run
fvm flutter analyze
fvm dart run build_runner build --delete-conflicting-outputs
fvm dart format .
```

## Stack

| Purpose | Package |
|---|---|
| HTTP | `dio` |
| Models and union types | `freezed` + `freezed_annotation` |
| JSON | `json_serializable` + `json_annotation` |
| State | `bloc` + `flutter_bloc` (`BlocProvider`, `BlocBuilder`, `BlocListener`) |
| Value equality | `equatable` |
| DI | `get_it` + `injectable` (+ `injectable_generator`) |
| Navigation | `go_router` |
| Local storage | `shared_preferences` |

Add new dependencies with `fvm flutter pub add`, and only when the task cannot be solved with the current stack.

## Architecture

A simple layout without a data / domain / presentation split and without use cases:

```
lib/
  core/              # DI, network (Network, AppApi), storage (Prefs), router, theme
  models/            # freezed models with fromJson
  repositories/      # work with AppApi and the cache (Prefs)
  features/<name>/   # bloc, screen and widgets of a single screen
  main.dart
```

- Flow: widget → bloc → `Repository` → `AppApi` / `Prefs`.
- One `Repository` (`repositories/repository.dart`, `@lazySingleton`) for the whole app; it holds `AppApi` and `Prefs`. Blocs receive it through the constructor.
- Blocs never access `AppApi` or `Prefs` directly, and widgets never access `Repository` directly — only through a bloc.
- Do not introduce an abstract interface for `Repository` until there is a second implementation.
- `Repository extends ChangeNotifier` and holds `currencies` and `rates`. Blocs read them from the repository and subscribe via `addListener` (unsubscribe in `close()`).
- `loadFromCache()` reads from `Prefs` synchronously and returns `false` if there is no data. Called in `main` before `runApp`.
- `loadFromNetwork()` loads from the network, saves to `Prefs`, updates the fields and calls `notifyListeners()`. Throws `NetworkException` and leaves the data untouched in that case. Concurrent calls share the same in-flight load.
- Startup order: `main` → `loadFromCache()`; if it returns `false`, call `loadFromNetwork()` right away. On `started`, Home calls `loadFromNetwork()` and shows the error, if any.
- Rates are loaded only for `Repository.baseCurrency` (`usd`); the rate for any pair comes from `ExchangeRates.rate(from, to)`.
- Register dependencies with `@injectable` / `@lazySingleton` annotations; do not register anything in `get_it` manually.
- Routes are defined in one place, `core/router`.

### Screens and navigation

Each screen is a `features/<name>/` folder with these files:

- `<name>_bloc.dart` — bloc annotated with `@injectable`; includes the event and state `part` files and `<name>_bloc.freezed.dart`.
- `<name>_event.dart` — `part of` the bloc, a freezed sealed class with factories (`const factory <Name>Event.started() = _Started;`).
- `<name>_state.dart` — `part of` the bloc, a plain class that `extends Equatable`: `const` constructor, `props` with all fields and a hand-written `copyWith`.
- Reference implementation: `features/home/`.
- `<name>_screen.dart` — UI; gets the bloc via `BlocBuilder` / `context.read`.
- `<name>_go_route.dart` — a `<Name>GoRoute extends GoRoute` class that creates a `BlocProvider` with `getIt<<Name>Bloc>()` and the screen.

Route paths are constants in `AppRouterLocations` only (`core/router/app_router_locations.dart`); never hardcode path strings. A new `<Name>GoRoute` goes into the `routes` list in `AppRouter` (`core/router/app_router.dart`).

### Bottom bar

- Tabs are `AppShellRoute extends StatefulShellRoute` (`core/router/app_shell_route.dart`, `indexedStack`: tab state is preserved when switching). The widget with the `NavigationBar` is `AppShell` (`core/router/app_shell.dart`).
- There are currently two tabs: Converter (`HomeGoRoute`) and Rates (`RatesGoRoute`). A new tab means a new `StatefulShellBranch` in `AppShellRoute` and a button in `AppShell`, in the same order.
- Rates: a list of all currencies that have a rate, except the selected one; the price is how much 1 unit of the currency costs in the selected one (`ExchangeRates.rate(code, base)`). The selected currency is a button on the right of the `AppBar` that opens `CurrencyPickerSheet`; defaults to `usd` and is not persisted. Takes data from `Repository` and subscribes to its changes, like Home.
- Screens without the bottom bar (e.g. History) are regular routes in `AppRouter.routes`, outside `AppShellRoute`; they are opened with `context.push` on top of the bar.

## Code generation

- Run `build_runner` after changing classes annotated with `@freezed`, `@JsonSerializable` or `@injectable`.
- Never edit generated files (`*.g.dart`, `*.freezed.dart`, `*.config.dart`) by hand.

## Exchange rates API

Source: [fawazahmed0/exchange-api](https://github.com/fawazahmed0/exchange-api). No key, no rate limits, static JSON.

- URL: `https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@{date}/v1`. The fallback server is not used for now.
- `{date}` is `latest` or a `YYYY-MM-DD` date.
- `GET /currencies.json` → `{ "usd": "US Dollar", ... }`
- `GET /currencies/{base}.json` → `{ "date": "2026-11-01", "{base}": { "eur": 0.92, ... } }`
- Currency codes are lowercase; the key holding the rates equals `{base}`.
- The list includes cryptocurrencies, so rates can be very small numbers.
- The rate of the base currency to itself comes as an integer (`"usd": 1`); convert values through `num`.

### Network layer (`core/network/`)

- `Network` is the only place where `Dio` is used. It receives `baseUrl` in the constructor, configures `Dio` in `_initDio`, and its `get<T>(path)` method turns `DioException` into `NetworkException`.
- `dio` joins `baseUrl + path` as plain strings, without adding `/`.
- `AppApi` (`@lazySingleton`) creates `Network(baseUrl: jsdelivrServer)` in its constructor and defines the endpoints: `getCurrencies({date})`, `getRates(base, {date})`. `jsdelivrServer` ends with `currency-api`; paths start with `@{date}/v1/...`.
- Add new endpoints as methods on `AppApi` that return models from `models/`, not `Map`.
- Only `Repository` talks to the network, and only through `AppApi`.

### Local storage (`core/storage/prefs.dart`)

- `Prefs` (`@singleton`) is the only place where `SharedPreferences` is used; the instance is private.
- It is created asynchronously via `@FactoryMethod(preResolve: true) Prefs.create()`, so `configureDependencies()` is async and `main` awaits it.
- Keys are `static const` fields in `Prefs`. New data: a key plus a `getX()` / `setX()` pair; store models as JSON via `toJson` / `fromJson`.
- Corrupted JSON is returned as `null`.
- `Prefs` only reads and writes data; logic (appending entries, sorting, choosing between network and cache) lives in `Repository`.

### Conversion history

- An entry is `HistoryEntry` (`from`, `to`, `rate`, `date`); the list is stored in `Prefs` under `historyKey` in insertion order.
- In `Repository`: `getHistory()` returns the newest first, `getLastHistoryEntry()` returns the last entry, `addHistoryEntry(entry)` appends to the end.
- Selected currencies are not stored separately: the last history entry is the "last selected pair", and Home uses it on startup (without history — `usd` → `eur`).
- `HomeBloc` adds an entry when the pair changes: a currency is selected or the currencies are swapped. Typing an amount does not write to history.

### Home screen

- Two amount fields, both editable: typing in the top one recalculates the bottom one and vice versa. The focused field is never overwritten from state.
- Before opening the bottom sheet and before swapping currencies, unfocus via the fields' `FocusNode.unfocus()`, not `FocusScope.of(context).unfocus()` — otherwise focus returns to the field after the sheet closes.
- Currency selection is `CurrencyPickerSheet.show(...)` from the shared `features/currency_picker/` feature. The calling screen passes the currency list; Home passes only currencies that have a rate.
- `currency_picker` has no route: `show()` creates the `BlocProvider` itself with `getIt<CurrencyPickerBloc>(param1: currencies, param2: selected)` (`@factoryParam`). Filtering happens in the bloc on the `queryChanged` event; the widget is stateless.
- Parse and format amounts with the extensions from `core/utils/amount_format.dart`: `text.parseAmount()` and `amount.formatAmount()`.

## Code style

- Linter: `analysis_options.yaml` (`flutter_lints` + strict analyzer modes). `fvm flutter analyze` must pass with no issues before a task is done.
- Format code with `fvm dart format .`.
- Avoid `print`, `dynamic` and `!` unless necessary.
- `DioException` never leaves `Network`; only `NetworkException` is thrown outward.
