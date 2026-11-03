extension AmountParsing on String {
  double? parseAmount() => double.tryParse(trim().replaceAll(',', '.'));
}

extension AmountFormatting on double {
  String formatAmount() {
    if (this == 0) return '0';
    final text = abs() >= 1 ? toStringAsFixed(2) : toStringAsPrecision(4);
    if (!text.contains('.') || text.contains('e')) return text;
    return text.replaceFirst(RegExp(r'\.?0+$'), '');
  }
}
