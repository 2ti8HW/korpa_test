import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/router/app_router_locations.dart';
import '../../core/utils/amount_format.dart';
import '../currency_picker/currency_picker_sheet.dart';
import 'home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  final _fromFocus = FocusNode();
  final _toFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _syncControllers(context.read<HomeBloc>().state);
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    _fromFocus.dispose();
    _toFocus.dispose();
    super.dispose();
  }

  void _syncControllers(HomeState state) {
    _syncField(_fromController, _fromFocus, state.fromAmount);
    _syncField(_toController, _toFocus, state.toAmount);
  }

  void _syncField(
    TextEditingController controller,
    FocusNode focusNode,
    double? amount,
  ) {
    if (focusNode.hasFocus) return;
    final text = amount?.formatAmount() ?? '';
    if (controller.text != text) controller.text = text;
  }

  void _unfocusFields() {
    _fromFocus.unfocus();
    _toFocus.unfocus();
  }

  Future<void> _pickCurrency({required bool isFrom}) async {
    _unfocusFields();
    final bloc = context.read<HomeBloc>();
    final state = bloc.state;
    final code = await CurrencyPickerSheet.show(
      context,
      currencies: state.availableCurrencies,
      selected: isFrom ? state.fromCurrency : state.toCurrency,
    );
    if (code == null) return;
    bloc.add(
      isFrom
          ? HomeEvent.fromCurrencySelected(code)
          : HomeEvent.toCurrencySelected(code),
    );
  }

  void _swap() {
    _unfocusFields();
    context.read<HomeBloc>().add(const HomeEvent.swapped());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) => _syncControllers(state),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Converter'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: 'Refresh rates',
                onPressed: state.isLoading
                    ? null
                    : () => context.read<HomeBloc>().add(const HomeEvent.refreshed()),
              ),
              IconButton(
                icon: const Icon(Icons.history),
                onPressed: () => context.push(AppRouterLocations.history),
              ),
            ],
          ),
          body: state.rates == null
              ? _NoRates(state: state)
              : GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: _unfocusFields,
                  child: ListView(
                    padding: const EdgeInsets.all(24),
                    children: [
                      _AmountRow(
                        currency: state.fromCurrency,
                        controller: _fromController,
                        focusNode: _fromFocus,
                        onCurrencyTap: () => _pickCurrency(isFrom: true),
                        onChanged: (text) => context.read<HomeBloc>().add(
                          HomeEvent.fromAmountChanged(text),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(Icons.swap_vert),
                          tooltip: 'Swap',
                          onPressed: _swap,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _AmountRow(
                        currency: state.toCurrency,
                        controller: _toController,
                        focusNode: _toFocus,
                        onCurrencyTap: () => _pickCurrency(isFrom: false),
                        onChanged: (text) => context.read<HomeBloc>().add(
                          HomeEvent.toAmountChanged(text),
                        ),
                      ),
                      const SizedBox(height: 32),
                      _RateInfo(state: state),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

class _AmountRow extends StatelessWidget {
  const _AmountRow({
    required this.currency,
    required this.controller,
    required this.focusNode,
    required this.onCurrencyTap,
    required this.onChanged,
  });

  final String currency;
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onCurrencyTap;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 104,
          child: TextButton(
            onPressed: onCurrencyTap,
            style: TextButton.styleFrom(alignment: Alignment.centerLeft),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    currency.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            onChanged: onChanged,
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.displayMedium,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*[.,]?\d*')),
            ],
            decoration: const InputDecoration(hintText: '0'),
          ),
        ),
      ],
    );
  }
}

class _RateInfo extends StatelessWidget {
  const _RateInfo({required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rate = state.rate;
    final rates = state.rates!;
    final from = state.fromCurrency.toUpperCase();
    final to = state.toCurrency.toUpperCase();
    final date = MaterialLocalizations.of(context).formatShortDate(rates.date);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          rate == null
              ? 'No rate for $from → $to'
              : '1 $from = ${rate.formatAmount()} $to',
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: 4),
        Text('Rates as of $date', style: theme.textTheme.bodySmall),
        if (state.isLoading) ...[
          const SizedBox(height: 12),
          const LinearProgressIndicator(),
        ],
        if (state.error != null) ...[
          const SizedBox(height: 12),
          Text(
            'No connection, showing saved rates',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.error,
            ),
          ),
        ],
      ],
    );
  }
}

class _NoRates extends StatelessWidget {
  const _NoRates({required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    if (state.error == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Could not load exchange rates'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () =>
                  context.read<HomeBloc>().add(const HomeEvent.started()),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
