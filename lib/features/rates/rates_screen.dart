import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/amount_format.dart';
import '../currency_picker/currency_picker_sheet.dart';
import 'rates_bloc.dart';

class RatesScreen extends StatelessWidget {
  const RatesScreen({super.key});

  Future<void> _pickBase(BuildContext context) async {
    final bloc = context.read<RatesBloc>();
    final code = await CurrencyPickerSheet.show(
      context,
      currencies: bloc.state.availableCurrencies,
      selected: bloc.state.base,
    );
    if (code != null) bloc.add(RatesEvent.baseSelected(code));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatesBloc, RatesState>(
      builder: (context, state) {
        final listed = state.listed;
        final base = state.base.toUpperCase();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Rates'),
            actions: [
              TextButton(
                onPressed: state.rates == null
                    ? null
                    : () => _pickBase(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(base, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(width: 4),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          body: state.rates == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemCount: listed.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final currency = listed[index];
                    final price = state.priceOf(currency.code);
                    return ListTile(
                      leading: SizedBox(
                        width: 56,
                        child: Text(
                          currency.code.toUpperCase(),
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      title: Text(currency.name),
                      trailing: Text(
                        price == null ? '—' : '${price.formatAmount()} $base',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
