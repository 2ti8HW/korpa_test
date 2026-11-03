import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injection.dart';
import '../../models/currency.dart';
import 'currency_picker_bloc.dart';

class CurrencyPickerSheet extends StatelessWidget {
  const CurrencyPickerSheet({super.key});

  static Future<String?> show(BuildContext context, {required List<Currency> currencies, required String selected}) {
    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (_) => BlocProvider(
        create: (_) => getIt<CurrencyPickerBloc>(param1: currencies, param2: selected),
        child: const CurrencyPickerSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.8,
      minChildSize: 0.4,
      builder: (context, scrollController) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: TextField(
              onChanged: (value) => context.read<CurrencyPickerBloc>().add(CurrencyPickerEvent.queryChanged(value)),
              decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Search currency'),
            ),
          ),
          Expanded(
            child: BlocBuilder<CurrencyPickerBloc, CurrencyPickerState>(
              builder: (context, state) => ListView.builder(
                controller: scrollController,
                itemCount: state.filtered.length,
                itemBuilder: (context, index) {
                  final currency = state.filtered[index];
                  final isSelected = currency.code == state.selected;
                  return ListTile(
                    leading: SizedBox(
                      width: 56,
                      child: Text(currency.code.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.w600)),
                    ),
                    title: Text(currency.name),
                    trailing: isSelected ? const Icon(Icons.check) : null,
                    selected: isSelected,
                    onTap: () => Navigator.of(context).pop(currency.code),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
