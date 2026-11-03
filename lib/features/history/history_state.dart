part of 'history_bloc.dart';

class HistoryState extends Equatable {
  const HistoryState({this.entries = const []});

  final List<HistoryEntry> entries;

  @override
  List<Object?> get props => [entries];

  HistoryState copyWith({List<HistoryEntry>? entries}) {
    return HistoryState(entries: entries ?? this.entries);
  }
}
