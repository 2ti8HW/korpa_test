import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/history_entry.dart';
import 'history_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('History')),
          body: state.entries.isEmpty
              ? const Center(child: Text('No history yet'))
              : ListView.separated(
                  itemCount: state.entries.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (context, index) => _HistoryTile(entry: state.entries[index]),
                ),
        );
      },
    );
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({required this.entry});

  final HistoryEntry entry;

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    final from = entry.from.toUpperCase();
    final to = entry.to.toUpperCase();
    final date = localizations.formatShortDate(entry.date);
    final time = localizations.formatTimeOfDay(TimeOfDay.fromDateTime(entry.date));

    return ListTile(
      title: Text('$from → $to'),
      subtitle: Text('1 $from = ${_formatRate(entry.rate)} $to'),
      trailing: Text('$date\n$time', textAlign: TextAlign.end),
    );
  }

  String _formatRate(double rate) => rate >= 1 ? rate.toStringAsFixed(4) : rate.toStringAsPrecision(4);
}
